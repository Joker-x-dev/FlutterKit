import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_kit/feature/demo/data/nested_scroll_demo_data.dart';
import 'package:flutter_kit/feature/demo/logics/nested_scroll_demo_logic.dart';
import 'package:flutter_kit/feature/demo/states/nested_scroll_demo_state.dart';

/// 嵌套滚动示例 State 与 Logic 契约测试。
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('State 提供三个独立默认帖子列表和有效素材路径', () {
    final NestedScrollDemoState state = NestedScrollDemoData.createState();
    final List<NestedScrollDemoPostItem> notes = state.postsForTab(
      NestedScrollDemoTab.notes,
    );
    final List<NestedScrollDemoPostItem> collections = state.postsForTab(
      NestedScrollDemoTab.collections,
    );
    final List<NestedScrollDemoPostItem> liked = state.postsForTab(
      NestedScrollDemoTab.liked,
    );

    expect(notes, hasLength(22));
    expect(collections, hasLength(22));
    expect(liked, hasLength(22));
    expect(notes, isNot(same(collections)));
    expect(collections, isNot(same(liked)));
    expect(
      notes.map((NestedScrollDemoPostItem item) => item.assetPath),
      everyElement('assets/image/grid.svg'),
    );
    expect(
      notes.map((NestedScrollDemoPostItem item) => item.assetPath).toSet(),
      hasLength(1),
    );
  });

  test('State 按标签类型返回注入的帖子列表', () {
    const NestedScrollDemoPostItem note = NestedScrollDemoPostItem(
      assetPath: 'note.svg',
      titleIndex: 1,
      author: 'Loren',
      likes: 1,
    );
    const NestedScrollDemoPostItem collection = NestedScrollDemoPostItem(
      assetPath: 'collection.svg',
      titleIndex: 2,
      author: 'Loren',
      likes: 2,
    );
    const NestedScrollDemoPostItem liked = NestedScrollDemoPostItem(
      assetPath: 'liked.svg',
      titleIndex: 3,
      author: 'Loren',
      likes: 3,
    );
    final NestedScrollDemoState state = NestedScrollDemoState(
      notePosts: const <NestedScrollDemoPostItem>[note],
      collectionPosts: const <NestedScrollDemoPostItem>[collection],
      likedPosts: const <NestedScrollDemoPostItem>[liked],
    );

    expect(state.postsForTab(NestedScrollDemoTab.notes), contains(note));
    expect(
      state.postsForTab(NestedScrollDemoTab.collections),
      contains(collection),
    );
    expect(state.postsForTab(NestedScrollDemoTab.liked), contains(liked));
  });

  test('刷新只轮换目标标签并执行一次等待任务', () async {
    final NestedScrollDemoState state = NestedScrollDemoData.createState();
    final List<NestedScrollDemoPostItem> initialNotes = List.of(
      state.postsForTab(NestedScrollDemoTab.notes),
    );
    final List<NestedScrollDemoPostItem> initialCollections = List.of(
      state.postsForTab(NestedScrollDemoTab.collections),
    );
    final List<NestedScrollDemoPostItem> initialLiked = List.of(
      state.postsForTab(NestedScrollDemoTab.liked),
    );
    final List<Duration> delays = <Duration>[];
    final NestedScrollDemoLogic logic = NestedScrollDemoLogic(
      state: state,
      refreshDelay: const Duration(milliseconds: 25),
      delayExecutor: (Duration duration) async {
        delays.add(duration);
      },
    );
    addTearDown(logic.onClose);

    await logic.refreshTab(NestedScrollDemoTab.collections);

    expect(delays, const <Duration>[Duration(milliseconds: 25)]);
    expect(
      state.postsForTab(NestedScrollDemoTab.notes),
      orderedEquals(initialNotes),
    );
    expect(
      state.postsForTab(NestedScrollDemoTab.liked),
      orderedEquals(initialLiked),
    );
    expect(
      state.postsForTab(NestedScrollDemoTab.collections),
      orderedEquals(<NestedScrollDemoPostItem>[
        ...initialCollections.skip(1),
        initialCollections.first,
      ]),
    );
  });

  test('并发刷新仅执行首次任务', () async {
    final Completer<void> refreshCompleter = Completer<void>();
    int delayExecutionCount = 0;
    final NestedScrollDemoState state = NestedScrollDemoData.createState();
    final List<NestedScrollDemoPostItem> initialCollections = List.of(
      state.postsForTab(NestedScrollDemoTab.collections),
    );
    final NestedScrollDemoLogic logic = NestedScrollDemoLogic(
      state: state,
      delayExecutor: (Duration _) {
        delayExecutionCount++;
        return refreshCompleter.future;
      },
    );
    addTearDown(logic.onClose);

    final Future<void> firstRefresh = logic.refreshTab(
      NestedScrollDemoTab.notes,
    );
    final Future<void> duplicateRefresh = logic.refreshTab(
      NestedScrollDemoTab.collections,
    );

    await duplicateRefresh;
    expect(delayExecutionCount, 1);
    expect(
      state.postsForTab(NestedScrollDemoTab.collections),
      orderedEquals(initialCollections),
    );

    refreshCompleter.complete();
    await firstRefresh;
    expect(delayExecutionCount, 1);
  });

  test('刷新失败后恢复并允许再次刷新', () async {
    int attemptCount = 0;
    final NestedScrollDemoState state = NestedScrollDemoData.createState();
    final List<NestedScrollDemoPostItem> initialNotes = List.of(
      state.postsForTab(NestedScrollDemoTab.notes),
    );
    final NestedScrollDemoLogic logic = NestedScrollDemoLogic(
      state: state,
      delayExecutor: (Duration _) async {
        attemptCount++;
        if (attemptCount == 1) {
          throw StateError('refresh failed');
        }
      },
    );
    addTearDown(logic.onClose);

    await expectLater(
      logic.refreshTab(NestedScrollDemoTab.notes),
      throwsStateError,
    );
    expect(
      state.postsForTab(NestedScrollDemoTab.notes),
      orderedEquals(initialNotes),
    );

    await logic.refreshTab(NestedScrollDemoTab.notes);
    expect(attemptCount, 2);
    expect(
      state.postsForTab(NestedScrollDemoTab.notes),
      orderedEquals(<NestedScrollDemoPostItem>[
        ...initialNotes.skip(1),
        initialNotes.first,
      ]),
    );
  });

  testWidgets('BaseTab 生命周期只创建 TabController 并统一释放', (
    WidgetTester tester,
  ) async {
    final NestedScrollDemoLogic logic = NestedScrollDemoLogic();

    logic.onInit();

    expect(logic.tabController.length, NestedScrollDemoTab.values.length);
    expect(logic.tabState.pageController, isNull);

    logic.onClose();
    expect(logic.tabState.tabController, isNull);
    expect(logic.tabState.pageController, isNull);
  });
}
