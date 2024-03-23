import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'style.dart';
import 'theme.dart';

class WxTile extends StatelessWidget {
  /// Create a basic tile
  const WxTile({
    Key? key,
    this.direction,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.childExpanded,
    this.spacingEnforced,
    this.spacing,
    this.margin,
    this.style,
    this.trailing,
    this.leading,
    required this.child,
  }) : super(key: key);

  /// {@macro WxTile.direction}
  final Axis? direction;

  /// {@macro WxTile.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro WxTile.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro WxTile.mainAxisExpanded}
  final bool? mainAxisExpanded;

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
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisExpanded: mainAxisExpanded,
          childExpanded: childExpanded,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = WxTileTheme.of(context);
    final themedStyle = theme.style.merge(effectiveStyle);

    final isSpacingEnforced = themedStyle.spacingEnforced;
    final isMainAxisExpanded = themedStyle.mainAxisExpanded;
    final isChildExpanded = isMainAxisExpanded! && themedStyle.childExpanded!;

    final isVertical = themedStyle.direction == Axis.vertical;
    final spacer = SizedBox(
      width: !isVertical ? themedStyle.spacing : null,
      height: isVertical ? themedStyle.spacing : null,
    );

    Widget content = Flex(
      direction: themedStyle.direction!,
      mainAxisAlignment: themedStyle.mainAxisAlignment!,
      crossAxisAlignment: themedStyle.crossAxisAlignment!,
      mainAxisSize: isMainAxisExpanded ? MainAxisSize.max : MainAxisSize.min,
      children: [
        leading,
        if (hasLeading || isSpacingEnforced!) spacer,
        isChildExpanded ? Expanded(child: child) : child,
        if (hasTrailing || isSpacingEnforced!) spacer,
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
