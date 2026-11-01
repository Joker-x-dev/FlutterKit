import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/widget/utility_extension.dart';
import 'package:flutter_test/flutter_test.dart';

/// 通用子组件包装扩展测试。
void main() {
  test('重绘边界和稳定 Key 保持原始子组件', () {
    const Widget child = SizedBox(key: ValueKey<String>('child'));

    final RepaintBoundary repaintBoundary =
        child.repaintBoundary(key: const ValueKey<String>('repaint'))
            as RepaintBoundary;
    expect(repaintBoundary.key, const ValueKey<String>('repaint'));
    expect(repaintBoundary.child, same(child));

    final KeyedSubtree keyedSubtree =
        child.keyed(const ValueKey<String>('subtree')) as KeyedSubtree;
    expect(keyedSubtree.key, const ValueKey<String>('subtree'));
    expect(keyedSubtree.child, same(child));
  });
}
