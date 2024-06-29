import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../tile/types.dart';
import '../tile/widget.dart';
import '../text_tile/widget.dart';
import 'style.dart';
import 'wrapper.dart';
import 'theme.dart';

class WxListTile extends StatelessWidget {
  /// Create a list item tile
  const WxListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.margin,
    this.padding,
    this.spacing,
    this.adaptiveSpacing,
    this.align,
    this.justify,
    this.inline,
    this.textWrap,
    this.textAlign,
    this.textSpacing,
    this.textColor,
    this.textOverflow,
    this.textSoftWrap,
    this.textWidthBasis,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
    this.titleSize,
    this.subtitleSize,
    this.titleColor,
    this.subtitleColor,
    this.titleMaxLines,
    this.subtitleMaxLines,
    this.titleWeight,
    this.subtitleWeight,
    this.titleStyle,
    this.subtitleStyle,
    this.secondaryStyle,
    this.style,
    this.onTap,
  });

  /// The primary content
  final Widget title;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// A widget to display before the [title] and [subtitle].
  final Widget? leading;

  /// A widget to display after the [title] and [subtitle].
  final Widget? trailing;

  /// {@macro WxListTile.margin}
  final EdgeInsetsGeometry? margin;

  /// {@macro WxListTile.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro WxListTile.spacing}
  final double? spacing;

  /// {@macro WxListTile.spacingEnforced}
  final bool? adaptiveSpacing;

  /// {@macro WxListTile.align}
  final WxTileAlign? align;

  /// {@macro WxListTile.justify}
  final WxTileJustify? justify;

  /// {@macro WxListTile.inline}
  final bool? inline;

  /// {@macro WxListTile.textWrap}
  final bool? textWrap;

  /// {@macro WxListTile.textAlign}
  final TextAlign? textAlign;

  /// {@macro WxListTile.textSpacing}
  final double? textSpacing;

  /// {@macro WxListTile.textColor}
  final Color? textColor;

  /// {@macro WxListTile.textOverflow}
  final TextOverflow? textOverflow;

  /// {@macro WxListTile.textSoftWrap}
  final bool? textSoftWrap;

  /// {@macro WxListTile.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro WxListTile.iconColor}
  final Color? iconColor;

  /// {@macro WxListTile.iconOpacity}
  final double? iconOpacity;

  /// {@macro WxListTile.iconSize}
  final double? iconSize;

  /// {@macro WxListTile.titleSize}
  final double? titleSize;

  /// {@macro WxListTile.subtitleSize}
  final double? subtitleSize;

  /// {@macro WxListTile.titleColor}
  final Color? titleColor;

  /// {@macro WxListTile.subtitleColor}
  final Color? subtitleColor;

  /// {@macro WxListTile.titleMaxLines}
  final int? titleMaxLines;

  /// {@macro WxListTile.subtitleMaxLines}
  final int? subtitleMaxLines;

  /// {@macro WxListTile.titleWeight}
  final FontWeight? titleWeight;

  /// {@macro WxListTile.subtitleWeight}
  final FontWeight? subtitleWeight;

  /// {@macro WxListTile.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro WxListTile.subtitleStyle}
  final TextStyle? subtitleStyle;

  /// {@macro WxListTile.secondaryStyle}
  final TextStyle? secondaryStyle;

  /// The style to be applied
  final WxListTileStyle? style;

  /// Called when the user taps this list tile.
  final GestureTapCallback? onTap;

  /// Merge [style] with shortcut props
  WxListTileStyle get effectiveStyle {
    return WxListTileStyle.from(style).copyWith(
      margin: margin,
      padding: padding,
      spacing: spacing,
      adaptiveSpacing: adaptiveSpacing,
      align: align,
      justify: justify,
      inline: inline,
      textWrap: textWrap,
      textAlign: textAlign,
      textSpacing: textSpacing,
      textColor: textColor,
      textOverflow: textOverflow,
      textSoftWrap: textSoftWrap,
      textWidthBasis: textWidthBasis,
      iconColor: iconColor,
      iconOpacity: iconOpacity,
      iconSize: iconSize,
      titleSize: titleSize,
      subtitleSize: subtitleSize,
      titleColor: titleColor,
      subtitleColor: subtitleColor,
      titleMaxLines: titleMaxLines,
      subtitleMaxLines: subtitleMaxLines,
      titleWeight: titleWeight,
      subtitleWeight: subtitleWeight,
      titleStyle: titleStyle,
      subtitleStyle: subtitleStyle,
      secondaryStyle: secondaryStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tileTheme = WxListTileTheme.of(context);
    final themedStyle = tileTheme.style.merge(effectiveStyle);

    TextStyle? effectiveSecondaryStyle = themedStyle.secondaryStyle;
    if (effectiveSecondaryStyle == null) {
      if (leading != null || trailing != null) {
        final theme = Theme.of(context);
        effectiveSecondaryStyle = theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        );
      }
    }

    Widget? leadingWidget;
    if (leading != null) {
      leadingWidget = DefaultTextStyle.merge(
        style: effectiveSecondaryStyle?.copyWith(
          color: themedStyle.textColor,
        ),
        child: leading!,
      );
    }

    Widget? trailingWidget;
    if (trailing != null) {
      trailingWidget = DefaultTextStyle.merge(
        style: effectiveSecondaryStyle?.copyWith(
          color: themedStyle.textColor,
        ),
        child: trailing!,
      );
    }

    Widget content = IconTheme.merge(
      data: IconThemeData(
        color: themedStyle.iconColor,
        opacity: themedStyle.iconOpacity,
        size: themedStyle.iconSize,
      ),
      child: IconButtonTheme(
        data: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: themedStyle.iconColor,
            iconSize: themedStyle.iconSize,
          ),
        ),
        child: WxTile(
          direction: Axis.horizontal,
          margin: themedStyle.padding,
          spacing: themedStyle.spacing,
          adaptiveSpacing: themedStyle.adaptiveSpacing,
          align: themedStyle.align,
          justify: themedStyle.justify,
          inline: themedStyle.inline,
          childWrap: themedStyle.textWrap,
          leading: leadingWidget,
          trailing: trailingWidget,
          child: WxTextTile(
            title: title,
            subtitle: subtitle,
            titleStyle: themedStyle.titleStyle,
            subtitleStyle: themedStyle.subtitleStyle,
            align: themedStyle.textAlign,
            spacing: themedStyle.textSpacing,
            color: themedStyle.textColor,
            overflow: themedStyle.textOverflow,
            softWrap: themedStyle.textSoftWrap,
            widthBasis: themedStyle.textWidthBasis,
            titleSize: themedStyle.titleSize,
            subtitleSize: themedStyle.subtitleSize,
            titleColor: themedStyle.titleColor,
            subtitleColor: themedStyle.subtitleColor,
            titleMaxLines: themedStyle.titleMaxLines,
            subtitleMaxLines: themedStyle.subtitleMaxLines,
            titleWeight: themedStyle.titleWeight,
            subtitleWeight: themedStyle.subtitleWeight,
          ),
        ),
      ),
    );

    // build gesture wrapper
    content = tileTheme.effectiveWrapper(
      context,
      WxListTileContext(
        onTap: onTap,
        style: themedStyle,
        child: content,
      ),
    );

    // added margin if needed
    if (themedStyle.margin != null) {
      content = Padding(
        padding: themedStyle.margin!,
        child: content,
      );
    }

    return content;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    effectiveStyle.debugFillProperties(properties);
  }
}

/// An inline tile is a compact version of [WxListTile]. It
/// removes some of the visual separation between the leading, title,
/// and trailing widgets, creating a more condensed appearance.
class WxInlineTile extends WxListTile {
  /// Creates an inline tile, a compact version of [WxListTile].
  ///
  /// By default, all the properties from [WxListTile] are inherited,
  /// however the `inline` property is always set to `true`.
  const WxInlineTile({
    super.key,
    required super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    super.margin,
    super.padding,
    super.spacing,
    super.adaptiveSpacing,
    super.align,
    super.justify,
    super.textWrap,
    super.textAlign,
    super.textSpacing,
    super.textColor,
    super.iconColor,
    super.titleStyle,
    super.subtitleStyle,
    super.secondaryStyle,
    super.style,
    super.onTap,
  });

  @override
  bool get inline => true;
}
