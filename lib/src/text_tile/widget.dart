import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../tile/widget.dart';
import 'style.dart';
import 'types.dart';
import 'theme.dart';

class WxTextTile extends StatelessWidget {
  const WxTextTile({
    Key? key,
    this.spacing,
    this.margin,
    this.align,
    this.style,
    this.subtitle,
    this.title,
  }) : super(key: key);

  final double? spacing;
  final EdgeInsetsGeometry? margin;
  final WxTextTileAlign? align;
  final WxTextTileStyle? style;
  final Widget? subtitle;
  final Widget? title;

  WxTextTileStyle get effectiveStyle {
    return WxTextTileStyle.from(style).copyWith(
      spacing: spacing,
      margin: margin,
      align: align,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = WxTextTileTheme.of(context);
    final themedStyle = theme.style.merge(effectiveStyle);
    return WxTile(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisExpanded: false,
      spacingEnforced: false,
      spacing: themedStyle.spacing,
      margin: themedStyle.margin,
      crossAxisAlignment: themedStyle.crossAxisAlignment,
      trailing: subtitle,
      child: title,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    effectiveStyle.debugFillProperties(properties);
  }
}
