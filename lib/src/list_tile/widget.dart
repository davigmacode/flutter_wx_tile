import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../tile/widget.dart';
import '../text_tile/types.dart';
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
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.inline,
    this.textExpanded,
    this.textAlign,
    this.textSpacing,
    this.textColor,
    this.iconColor,
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
  final bool? spacingEnforced;

  /// {@macro WxListTile.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro WxListTile.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro WxListTile.inline}
  final bool? inline;

  /// {@macro WxListTile.textExpanded}
  final bool? textExpanded;

  /// {@macro WxListTile.textAlign}
  final WxTextAlign? textAlign;

  /// {@macro WxListTile.textSpacing}
  final double? textSpacing;

  /// {@macro WxListTile.textColor}
  final Color? textColor;

  /// {@macro WxListTile.iconColor}
  final Color? iconColor;

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
      spacingEnforced: spacingEnforced,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      inline: inline,
      textExpanded: textExpanded,
      textAlign: textAlign,
      textSpacing: textSpacing,
      textColor: textColor,
      iconColor: iconColor,
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

    final effectiveIconColor = themedStyle.iconColor;
    final iconThemeData = IconThemeData(color: effectiveIconColor);
    final iconButtonThemeData = IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: effectiveIconColor),
    );

    Widget content = IconTheme.merge(
      data: iconThemeData,
      child: IconButtonTheme(
        data: iconButtonThemeData,
        child: WxTile(
          direction: Axis.horizontal,
          margin: themedStyle.padding,
          spacing: themedStyle.spacing,
          spacingEnforced: themedStyle.spacingEnforced,
          crossAxisAlignment: themedStyle.crossAxisAlignment,
          mainAxisAlignment: themedStyle.mainAxisAlignment,
          inline: themedStyle.inline,
          childExpanded: themedStyle.textExpanded,
          leading: leadingWidget,
          trailing: trailingWidget,
          child: WxTextTile(
            title: title,
            subtitle: subtitle,
            titleStyle: themedStyle.titleStyle,
            subtitleStyle: themedStyle.subtitleStyle,
            align: themedStyle.textAlign,
            spacing: themedStyle.textSpacing,
            textColor: themedStyle.textColor,
            titleSize: themedStyle.titleSize,
            subtitleSize: themedStyle.subtitleSize,
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
    super.spacingEnforced,
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.textExpanded,
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
