import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.textColor,
  }) : super(key: key);

  /// {@macro WxTextTile.spacing}
  final double? spacing;

  /// {@macro WxTextTile.margin}
  final EdgeInsetsGeometry? margin;

  /// {@macro WxTextTile.align}
  final WxTextTileAlign? align;

  /// The style to be applied
  final WxTextTileStyle? style;

  /// The primary content
  final Widget title;

  /// {@macro WxTextTile.titleStyle}
  final TextStyle? titleStyle;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// {@macro WxTextTile.subtitleStyle}
  final TextStyle? subtitleStyle;

  /// {@macro WxTextTile.textColor}
  final Color? textColor;

  WxTextTileStyle get effectiveStyle {
    return WxTextTileStyle.from(style).copyWith(
      spacing: spacing,
      margin: margin,
      align: align,
      titleStyle: titleStyle,
      subtitleStyle: subtitleStyle,
      textColor: textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tileTheme = WxTextTileTheme.of(context);
    final themedStyle = tileTheme.style.merge(effectiveStyle);

    ThemeData? theme;

    TextStyle? effectiveTitleStyle = themedStyle.titleStyle;
    if (effectiveTitleStyle == null) {
      theme = Theme.of(context);
      effectiveTitleStyle = theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.onSurface,
      );
    }
    final titleText = DefaultTextStyle.merge(
      style: effectiveTitleStyle?.copyWith(color: themedStyle.textColor),
      child: title,
    );

    Widget? subtitleText;
    if (subtitle != null) {
      TextStyle? effectiveSubtitleStyle = themedStyle.subtitleStyle;
      if (effectiveSubtitleStyle == null) {
        theme ??= Theme.of(context);
        effectiveSubtitleStyle = theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        );
      }
      subtitleText = DefaultTextStyle.merge(
        style: effectiveSubtitleStyle?.copyWith(color: themedStyle.textColor),
        child: subtitle!,
      );
    }

    return WxTile(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      inline: false,
      spacingEnforced: false,
      spacing: themedStyle.spacing,
      margin: themedStyle.margin,
      crossAxisAlignment: themedStyle.crossAxisAlignment,
      trailing: subtitleText,
      child: titleText,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    effectiveStyle.debugFillProperties(properties);
  }
}
