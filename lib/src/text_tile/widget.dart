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
    this.overflow,
    this.softWrap,
    this.widthBasis,
    this.titleStyle,
    this.titleColor,
    this.titleWeight,
    this.titleSize,
    this.titleMaxLines,
    this.subtitleStyle,
    this.subtitleColor,
    this.subtitleWeight,
    this.subtitleSize,
    this.subtitleMaxLines,
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

  /// {@macro WxTextTile.overflow}
  final TextOverflow? overflow;

  /// {@macro WxTextTile.softWrap}
  final bool? softWrap;

  /// {@macro WxTextTile.widthBasis}
  final TextWidthBasis? widthBasis;

  /// {@macro WxTextTile.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro WxTextTile.titleColor}
  final Color? titleColor;

  /// {@macro WxTextTile.titleWeight}
  final FontWeight? titleWeight;

  /// {@macro WxTextTile.titleSize}
  final double? titleSize;

  /// {@template WxTextTile.titleMaxLines}
  /// The text max lines to be applied to title.
  /// {@endtemplate}
  final int? titleMaxLines;

  /// {@macro WxTextTile.subtitleStyle}
  final TextStyle? subtitleStyle;

  /// {@macro WxTextTile.subtitleColor}
  final Color? subtitleColor;

  /// {@macro WxTextTile.subtitleWeight}
  final FontWeight? subtitleWeight;

  /// {@macro WxTextTile.subtitleSize}
  final double? subtitleSize;

  /// {@macro WxTextTile.subtitleMaxLines}
  final int? subtitleMaxLines;

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
      overflow: overflow,
      softWrap: softWrap,
      widthBasis: widthBasis,
      titleStyle: titleStyle,
      titleColor: titleColor,
      titleWeight: titleWeight,
      titleSize: titleSize,
      titleMaxLines: titleMaxLines,
      subtitleStyle: subtitleStyle,
      subtitleColor: subtitleColor,
      subtitleWeight: subtitleWeight,
      subtitleSize: subtitleSize,
      subtitleMaxLines: subtitleMaxLines,
    );
  }

  /// [CrossAxisAlignment] from [align]
  CrossAxisAlignment getAlign(BuildContext context) {
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
        fontWeight: themedStyle.titleWeight,
      ),
      textAlign: themedStyle.align,
      textWidthBasis: themedStyle.widthBasis,
      softWrap: themedStyle.softWrap,
      overflow: themedStyle.overflow,
      maxLines: themedStyle.titleMaxLines,
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
          fontWeight: themedStyle.subtitleWeight,
        ),
        textAlign: themedStyle.align,
        textWidthBasis: themedStyle.widthBasis,
        softWrap: themedStyle.softWrap,
        overflow: themedStyle.overflow,
        maxLines: themedStyle.titleMaxLines,
        child: subtitle!,
      );
    }

    return WxTile(
      inline: true,
      direction: Axis.vertical,
      align: getAlign(context),
      justify: MainAxisAlignment.start,
      adaptiveSpacing: true,
      spacing: themedStyle.spacing,
      margin: themedStyle.margin,
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
