import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'style.dart';
import 'theme.dart';

class WxTile extends StatelessWidget {
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
    this.child,
  }) : super(key: key);

  final Axis? direction;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? mainAxisExpanded;
  final bool? childExpanded;
  final bool? spacingEnforced;
  final double? spacing;
  final EdgeInsetsGeometry? margin;
  final WxTileStyle? style;
  final Widget? leading;
  final Widget? trailing;
  final Widget? child;

  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;
  bool get hasChild => child != null;

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
    final isChildExpanded =
        hasChild && isMainAxisExpanded! && themedStyle.childExpanded!;
    final isVertical = themedStyle.direction == Axis.vertical;
    final spacer = SizedBox(
      width: !isVertical ? themedStyle.spacing : null,
      height: isVertical ? themedStyle.spacing : null,
    );

    Widget content = Flex(
      direction: themedStyle.direction!,
      mainAxisAlignment: themedStyle.mainAxisAlignment!,
      crossAxisAlignment: themedStyle.crossAxisAlignment!,
      mainAxisSize: isMainAxisExpanded! ? MainAxisSize.max : MainAxisSize.min,
      children: [
        leading,
        if (hasLeading || isSpacingEnforced!) spacer,
        isChildExpanded ? Expanded(child: child!) : child,
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
