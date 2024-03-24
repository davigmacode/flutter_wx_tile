import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../tile/widget.dart';
import '../text_tile/types.dart';
import '../text_tile/widget.dart';
import 'style.dart';
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
    this.titleStyle,
    this.subtitleStyle,
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

  /// {@macro WxListTile.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro WxListTile.subtitleStyle}
  final TextStyle? subtitleStyle;

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
      titleStyle: titleStyle,
      subtitleStyle: subtitleStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = WxListTileTheme.of(context);
    final themedStyle = theme.style.merge(effectiveStyle);
    Widget content = WxTile(
      direction: Axis.horizontal,
      margin: themedStyle.padding,
      spacing: themedStyle.spacing,
      spacingEnforced: themedStyle.spacingEnforced,
      crossAxisAlignment: themedStyle.crossAxisAlignment,
      mainAxisAlignment: themedStyle.mainAxisAlignment,
      inline: themedStyle.inline,
      childExpanded: themedStyle.textExpanded,
      leading: leading,
      trailing: trailing,
      child: WxTextTile(
        title: title,
        subtitle: subtitle,
        titleStyle: themedStyle.titleStyle,
        subtitleStyle: themedStyle.subtitleStyle,
        align: themedStyle.textAlign,
        spacing: themedStyle.textSpacing,
      ),
    );

    // build gesture wrapper
    content = theme.effectiveBuilder(context, content, onTap);

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
