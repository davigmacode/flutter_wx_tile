import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../tile/widget.dart';
import 'style.dart';
import 'theme.dart';

class WxTextTile extends StatelessWidget {
  const WxTextTile({
    super.key,
    this.spacing,
    this.margin,
    this.align,
    this.color,
    this.titleStyle,
    this.titleColor,
    this.titleSize,
    this.subtitleStyle,
    this.subtitleColor,
    this.subtitleSize,
    this.style,
    required this.title,
    this.subtitle,
  });

  /// {@macro WxTextTile.spacing}
  final double? spacing;

  /// {@macro WxTextTile.margin}
  final EdgeInsetsGeometry? margin;

  /// {@macro WxTextTile.align}
  final TextAlign? align;

  /// {@macro WxTextTile.color}
  final Color? color;

  /// {@macro WxTextTile.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro WxTextTile.titleColor}
  final Color? titleColor;

  /// {@macro WxTextTile.titleSize}
  final double? titleSize;

  /// {@macro WxTextTile.subtitleStyle}
  final TextStyle? subtitleStyle;

  /// {@macro WxTextTile.subtitleColor}
  final Color? subtitleColor;

  /// {@macro WxTextTile.subtitleSize}
  final double? subtitleSize;

  /// The style to be applied
  final WxTextTileStyle? style;

  /// The primary content
  final Widget title;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  WxTextTileStyle get effectiveStyle {
    return WxTextTileStyle.from(style).copyWith(
      spacing: spacing,
      margin: margin,
      align: align,
      color: color,
      titleStyle: titleStyle,
      titleColor: titleColor,
      titleSize: titleSize,
      subtitleStyle: subtitleStyle,
      subtitleColor: subtitleColor,
      subtitleSize: subtitleSize,
    );
  }

  /// [CrossAxisAlignment] from [align]
  CrossAxisAlignment getCrossAxisAlignment(BuildContext context) {
    final direction = Directionality.of(context);
    switch (effectiveStyle.align) {
      case TextAlign.start:
        if (direction == TextDirection.ltr) {
          return CrossAxisAlignment.start;
        } else {
          return CrossAxisAlignment.end;
        }
      case TextAlign.end:
        if (direction == TextDirection.rtl) {
          return CrossAxisAlignment.start;
        } else {
          return CrossAxisAlignment.end;
        }
      case TextAlign.center:
        return CrossAxisAlignment.center;
      case TextAlign.right:
        return CrossAxisAlignment.end;
      case TextAlign.left:
      case TextAlign.justify:
      default:
        return CrossAxisAlignment.start;
    }
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
      style: effectiveTitleStyle?.copyWith(
        color: themedStyle.titleColor ?? themedStyle.color,
        fontSize: themedStyle.titleSize,
      ),
      textAlign: themedStyle.align,
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
        style: effectiveSubtitleStyle?.copyWith(
          color: themedStyle.subtitleColor ?? themedStyle.color,
          fontSize: themedStyle.subtitleSize,
        ),
        textAlign: themedStyle.align,
        child: subtitle!,
      );
    }

    return WxTile(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      inline: true,
      spacingEnforced: false,
      spacing: themedStyle.spacing,
      margin: themedStyle.margin,
      crossAxisAlignment: getCrossAxisAlignment(context),
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
