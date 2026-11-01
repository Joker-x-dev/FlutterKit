import 'package:flutter_test/flutter_test.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'package:flutter_kit/core/design_system/theme/color.dart' as app_color;
import 'package:flutter_kit/core/design_system/theme/shadows.dart'
    as app_shadow;
import 'package:flutter_kit/core/design_system/theme/shape.dart' as app_shape;
import 'package:flutter_kit/core/design_system/theme/size.dart' as app_size;
import 'package:flutter_kit/core/design_system/theme/type.dart' as app_type;

import '../../support/test_environment.dart';

/// 颜色、尺寸、形状、阴影和字体语义 Getter 映射测试。
void main() {
  setUp(initializeCoreTestEnvironment);
  tearDown(resetCoreTestEnvironment);

  testWidgets('表驱动验证全部主题语义 Getter', (WidgetTester tester) async {
    late List<List<Object?>> mappings;
    await tester.pumpWidget(
      buildCoreTestApp(
        home: Builder(
          builder: (BuildContext context) {
            final TThemeData theme = context.tTheme;
            mappings = <List<Object?>>[
              <Object?>[app_color.primary, theme.brandColor7],
              <Object?>[app_color.primaryLight, theme.brandColor1],
              <Object?>[app_color.primaryDark, theme.brandColor8],
              <Object?>[app_color.primaryDisabled, theme.brandColor3],
              <Object?>[app_color.primaryFocus, theme.brandColor2],
              <Object?>[app_color.primaryActive, theme.brandColor8],
              <Object?>[app_color.success, theme.successColor5],
              <Object?>[app_color.successLight, theme.successColor1],
              <Object?>[app_color.successDisabled, theme.successColor3],
              <Object?>[app_color.successFocus, theme.successColor2],
              <Object?>[app_color.successActive, theme.successColor6],
              <Object?>[app_color.warning, theme.warningColor5],
              <Object?>[app_color.warningLight, theme.warningColor1],
              <Object?>[app_color.warningDisabled, theme.warningColor3],
              <Object?>[app_color.warningFocus, theme.warningColor2],
              <Object?>[app_color.warningActive, theme.warningColor6],
              <Object?>[app_color.error, theme.errorColor6],
              <Object?>[app_color.errorLight, theme.errorColor1],
              <Object?>[app_color.errorDisabled, theme.errorColor3],
              <Object?>[app_color.errorFocus, theme.errorColor2],
              <Object?>[app_color.errorActive, theme.errorColor7],
              <Object?>[app_color.backgroundPage, theme.grayColor2],
              <Object?>[app_color.backgroundContainer, theme.whiteColor1],
              <Object?>[app_color.backgroundContainerActive, theme.grayColor3],
              <Object?>[
                app_color.backgroundSecondaryContainer,
                theme.grayColor1,
              ],
              <Object?>[
                app_color.backgroundSecondaryContainerActive,
                theme.grayColor4,
              ],
              <Object?>[app_color.backgroundComponent, theme.grayColor3],
              <Object?>[app_color.backgroundComponentActive, theme.grayColor6],
              <Object?>[
                app_color.backgroundComponentDisabled,
                theme.grayColor2,
              ],
              <Object?>[app_color.textPrimary, theme.fontGray1],
              <Object?>[app_color.textSecondary, theme.fontGray2],
              <Object?>[app_color.textPlaceholder, theme.fontGray3],
              <Object?>[app_color.textDisabled, theme.fontGray4],
              <Object?>[app_color.textAnti, theme.whiteColor1],
              <Object?>[app_color.textBrand, theme.brandColor7],
              <Object?>[app_color.textLink, theme.brandColor8],
              <Object?>[app_color.borderLevel1, theme.grayColor3],
              <Object?>[app_color.borderLevel2, theme.grayColor4],
              <Object?>[app_shadow.shadowBase, theme.shadow1],
              <Object?>[app_shadow.shadowMiddle, theme.shadow2],
              <Object?>[app_shadow.shadowTop, theme.shadow3],
              <Object?>[app_type.fontDisplayLarge, theme.fontDisplayLarge],
              <Object?>[app_type.fontDisplayMedium, theme.fontDisplayMedium],
              <Object?>[app_type.fontHeadlineLarge, theme.fontHeadlineLarge],
              <Object?>[app_type.fontHeadlineMedium, theme.fontHeadlineMedium],
              <Object?>[app_type.fontHeadlineSmall, theme.fontHeadlineSmall],
              <Object?>[
                app_type.fontTitleExtraLarge,
                theme.fontTitleExtraLarge,
              ],
              <Object?>[app_type.fontTitleLarge, theme.fontTitleLarge],
              <Object?>[app_type.fontTitleMedium, theme.fontTitleMedium],
              <Object?>[app_type.fontTitleSmall, theme.fontTitleSmall],
              <Object?>[app_type.fontBodyLarge, theme.fontBodyLarge],
              <Object?>[app_type.fontBodyMedium, theme.fontBodyMedium],
              <Object?>[app_type.fontBodySmall, theme.fontBodySmall],
              <Object?>[app_type.fontBodyExtraSmall, theme.fontBodyExtraSmall],
              <Object?>[app_type.fontMarkLarge, theme.fontMarkLarge],
              <Object?>[app_type.fontMarkMedium, theme.fontMarkMedium],
              <Object?>[app_type.fontMarkSmall, theme.fontMarkSmall],
              <Object?>[app_type.fontMarkExtraSmall, theme.fontMarkExtraSmall],
              <Object?>[app_type.fontLinkLarge, theme.fontLinkLarge],
              <Object?>[app_type.fontLinkMedium, theme.fontLinkMedium],
              <Object?>[app_type.fontLinkSmall, theme.fontLinkSmall],
            ];
            return const SizedBox();
          },
        ),
      ),
    );

    for (final List<Object?> mapping in mappings) {
      expect(mapping.first, mapping.last);
    }
  });

  testWidgets('语义形状、阴影、边距和字重返回完整对象', (WidgetTester tester) async {
    late List<Object?> values;
    await tester.pumpWidget(
      buildCoreTestApp(
        home: Builder(
          builder: (BuildContext context) {
            values = <Object?>[
              app_shape.smallRoundedShape,
              app_shape.defaultRoundedShape,
              app_shape.largeRoundedShape,
              app_shape.extraLargeRoundedShape,
              app_shape.roundShape,
              app_shape.circleShape,
              app_shadow.cardShadow,
              app_shadow.popupShadow,
              app_shadow.overlayShadow,
              app_shadow.buttonShadow,
              app_size.pagePadding,
              app_size.pageVerticalPadding,
              app_size.cardPadding,
              app_size.listItemPadding,
              app_size.formItemSpacer,
              app_size.buttonHorizontalSpacer,
              app_size.textIconSpacer,
              app_type.fontWeightRegular,
              app_type.fontWeightMedium,
              app_type.fontWeightBold,
            ];
            return const SizedBox();
          },
        ),
      ),
    );

    expect(values, everyElement(isNotNull));
    expect(app_size.spaceDivider, 0.5);
    expect(app_size.spaceIndicator, 2);
  });
}
