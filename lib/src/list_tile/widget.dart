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
    Key? key,
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
    this.titleStyle,
    this.subtitleStyle,
    this.secondaryStyle,
    this.style,
    this.onTap,
  }) : super(key: key);

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
  final WxTextTileAlign? textAlign;

  /// {@macro WxListTile.textSpacing}
  final double? textSpacing;

  /// {@macro WxListTile.textColor}
  final Color? textColor;

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

    Widget content = WxTile(
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
