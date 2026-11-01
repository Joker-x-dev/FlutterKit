import 'package:flutter_kit/generated/assets.gen.dart';

import '../states/nested_scroll_demo_state.dart';

/// 嵌套滚动示例静态展示数据。
abstract final class NestedScrollDemoData {
  /// 每个标签的默认帖子数量。
  static const int _postCount = 22;

  /// 构建页面初始展示状态。
  static NestedScrollDemoState createState() {
    return NestedScrollDemoState(
      notePosts: createPosts(startOffset: 0),
      collectionPosts: createPosts(startOffset: 7),
      likedPosts: createPosts(startOffset: 14),
    );
  }

  /// 构建确定顺序的帖子列表。
  ///
  /// [startOffset] 当前标签的数据序号起始偏移。
  static List<NestedScrollDemoPostItem> createPosts({
    required int startOffset,
  }) {
    return List<NestedScrollDemoPostItem>.generate(_postCount, (int index) {
      final int dataIndex = (index + startOffset) % _postCount;
      return NestedScrollDemoPostItem(
        assetPath: Assets.image.grid.path,
        titleIndex: index + 1,
        author: 'Loren',
        likes: 128 + ((dataIndex + 1) * 137) % 4000,
      );
    }, growable: false);
  }
}
