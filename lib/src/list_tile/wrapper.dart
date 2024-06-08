import 'package:flutter/material.dart';
import 'style.dart';

typedef WxListTileBuilder = Widget Function(
  BuildContext context,
  WxListTileContext widget,
);

class WxListTileContext {
  WxListTileContext({
    this.onTap,
    required this.style,
    required this.child,
  });

  /// Called when the user taps this list tile.
  final GestureTapCallback? onTap;

  /// The style to be applied
  final WxListTileStyle style;

  /// Final result widget
  final Widget child;
}

abstract class WxListTileWrapper {
  static WxListTileBuilder inkWell({
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    BorderRadius? borderRadius,
  }) {
    return (context, widget) {
      if (widget.onTap != null) {
        return InkWell(
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          splashFactory: splashFactory,
          borderRadius: borderRadius,
          onTap: widget.onTap,
          child: widget.child,
        );
      }
      return widget.child;
    };
  }
}
