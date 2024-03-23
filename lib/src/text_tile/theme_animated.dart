import 'package:flutter/material.dart';
import 'theme_data.dart';
import 'theme.dart';
import 'tween.dart';

/// A widget that animates the [WxTextTileThemeData] implicitly.
class WxAnimatedTextTileTheme extends ImplicitlyAnimatedWidget {
  /// The [WxTextTileThemeData] to be applied to descendant [TextTile]s
  final WxTextTileThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that animates the [data] implicitly.
  const WxAnimatedTextTileTheme({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 200),
    VoidCallback? onEnd,
    required this.data,
    required this.child,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  @override
  AnimatedWidgetBaseState<WxAnimatedTextTileTheme> createState() =>
      _AnimatedIconThemeState();
}

class _AnimatedIconThemeState
    extends AnimatedWidgetBaseState<WxAnimatedTextTileTheme> {
  WxTextTileThemeDataTween? _dataTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _dataTween = visitor(
      _dataTween,
      widget.data,
      (dynamic value) => WxTextTileThemeDataTween(begin: value),
    ) as WxTextTileThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    return WxTextTileTheme.merge(
      data: _dataTween?.evaluate(animation),
      child: widget.child,
    );
  }
}
