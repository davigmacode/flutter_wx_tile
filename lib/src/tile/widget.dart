import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'style.dart';
import 'types.dart';
import 'theme.dart';

class WxTile extends StatelessWidget {
  /// Create a basic tile
  const WxTile({
    super.key,
    this.direction,
    this.align,
    this.justify,
    this.inline,
    this.childExpanded,
    this.spacingEnforced,
    this.spacing,
    this.margin,
    this.style,
    this.trailing,
    this.leading,
    required this.child,
  });

  /// {@macro WxTile.direction}
  final Axis? direction;

  /// {@macro WxTile.align}
  final WxTileAlign? align;

  /// {@macro WxTile.justify}
  final WxTileJustify? justify;

  /// {@macro WxTile.inline}
  final bool? inline;

  /// {@macro WxTile.childExpanded}
  final bool? childExpanded;

  /// {@macro WxTile.spacingEnforced}
  final bool? spacingEnforced;

  /// {@macro WxTile.spacing}
  final double? spacing;

  /// {@macro WxTile.margin}
  final EdgeInsetsGeometry? margin;

  /// The style to be applied to the tile widget.
  final WxTileStyle? style;

  /// A widget to display before the [child].
  final Widget? leading;

  /// A widget to display after the [child].
  final Widget? trailing;

  /// The widget below this widget in the tree.
  final Widget child;

  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;

  WxTileStyle get effectiveStyle {
    return const WxTileStyle().merge(style).copyWith(
          direction: direction,
          margin: margin,
          spacing: spacing,
          spacingEnforced: spacingEnforced,
          align: align,
          justify: justify,
          inline: inline,
          childExpanded: childExpanded,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = WxTileTheme.of(context);
    final themedStyle = theme.style.merge(effectiveStyle);

    final isSpacingEnforced = themedStyle.spacingEnforced == true;
    final isInline = themedStyle.inline == true;
    final isChildExpanded = !isInline && themedStyle.childExpanded == true;

    final isVertical = themedStyle.direction == Axis.vertical;
    final spacer = SizedBox(
      width: !isVertical ? themedStyle.spacing : null,
      height: isVertical ? themedStyle.spacing : null,
    );

    Widget content = Flex(
      direction: themedStyle.direction!,
      mainAxisAlignment: themedStyle.justify!,
      crossAxisAlignment: themedStyle.align!,
      mainAxisSize: isInline ? MainAxisSize.min : MainAxisSize.max,
      children: [
        leading,
        if (hasLeading || isSpacingEnforced) spacer,
        isChildExpanded ? Expanded(child: child) : child,
        if (hasTrailing || isSpacingEnforced) spacer,
        trailing,
      ].whereType<Widget>().toList(growable: false),
    );

    if (themedStyle.margin != EdgeInsets.zero) {
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
