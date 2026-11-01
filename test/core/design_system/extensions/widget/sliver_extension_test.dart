import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/widget/sliver_extension.dart';
import 'package:flutter_test/flutter_test.dart';

/// Sliver 子组件包装扩展测试。
void main() {
  test('Box、间距和重叠吸收包装保持原始子组件', () {
    const Widget boxChild = SizedBox(key: ValueKey<String>('box'));
    final SliverToBoxAdapter adapter =
        boxChild.sliverToBoxAdapter(key: const ValueKey<String>('adapter'))
            as SliverToBoxAdapter;
    expect(adapter.key, const ValueKey<String>('adapter'));
    expect(adapter.child, same(boxChild));

    final Widget sliver = const SliverToBoxAdapter(child: SizedBox());
    final SliverPadding padding =
        sliver.sliverPadding(
              const EdgeInsets.all(12),
              key: const ValueKey<String>('padding'),
            )
            as SliverPadding;
    expect(padding.key, const ValueKey<String>('padding'));
    expect(padding.padding, const EdgeInsets.all(12));
    expect(padding.child, same(sliver));

    final SliverOverlapAbsorberHandle handle = SliverOverlapAbsorberHandle();
    addTearDown(handle.dispose);
    final SliverOverlapAbsorber absorber =
        sliver.sliverOverlapAbsorber(
              key: const ValueKey<String>('absorber'),
              handle: handle,
            )
            as SliverOverlapAbsorber;
    expect(absorber.key, const ValueKey<String>('absorber'));
    expect(absorber.handle, same(handle));
    expect(absorber.child, same(sliver));
  });
}
