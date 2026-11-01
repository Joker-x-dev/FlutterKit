import 'package:get/get.dart';

/// 嵌套滚动示例标签类型。
enum NestedScrollDemoTab {
  /// 笔记标签。
  notes,

  /// 收藏标签。
  collections,

  /// 赞过标签。
  liked,
}

/// 嵌套滚动示例帖子展示模型。
class NestedScrollDemoPostItem {
  /// 创建个人主页帖子展示模型。
  ///
  /// [assetPath] 帖子图片资源路径。
  /// [titleIndex] 本地化标题模板使用的序号。
  /// [author] 帖子作者名称。
  /// [likes] 帖子点赞数量。
  const NestedScrollDemoPostItem({
    required this.assetPath,
    required this.titleIndex,
    required this.author,
    required this.likes,
  });

  /// 帖子图片资源路径。
  final String assetPath;

  /// 本地化标题模板使用的序号。
  final int titleIndex;

  /// 帖子作者名称。
  final String author;

  /// 帖子点赞数量。
  final int likes;
}

/// 嵌套滚动示例展示状态。
class NestedScrollDemoState {
  /// 创建嵌套滚动示例展示状态。
  ///
  /// [notePosts] 笔记 Tab 的初始帖子。
  /// [collectionPosts] 收藏 Tab 的初始帖子。
  /// [likedPosts] 赞过 Tab 的初始帖子。
  NestedScrollDemoState({
    required List<NestedScrollDemoPostItem> notePosts,
    required List<NestedScrollDemoPostItem> collectionPosts,
    required List<NestedScrollDemoPostItem> likedPosts,
  }) : _postsByTab = <RxList<NestedScrollDemoPostItem>>[
         RxList<NestedScrollDemoPostItem>(
           List<NestedScrollDemoPostItem>.of(notePosts),
         ),
         RxList<NestedScrollDemoPostItem>(
           List<NestedScrollDemoPostItem>.of(collectionPosts),
         ),
         RxList<NestedScrollDemoPostItem>(
           List<NestedScrollDemoPostItem>.of(likedPosts),
         ),
       ];

  /// 按标签声明顺序保存的帖子列表。
  final List<RxList<NestedScrollDemoPostItem>> _postsByTab;

  /// 返回指定 Tab 的帖子列表。
  ///
  /// [tab] 目标标签。
  RxList<NestedScrollDemoPostItem> postsForTab(NestedScrollDemoTab tab) {
    return _postsByTab[tab.index];
  }
}
