import 'package:flutter/material.dart';
import 'theme_data.dart';
import 'theme.dart';
import 'tween.dart';

/// A widget that animates the [WxTileThemeData] implicitly.
class WxAnimatedTileTheme extends ImplicitlyAnimatedWidget {
  /// The [WxTileThemeData] to be applied to descendant [Tile]s
  final WxTileThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that animates the [data] implicitly.
  const WxAnimatedTileTheme({
    super.key,
    super.curve = Curves.linear,
    super.duration = const Duration(milliseconds: 200),
    super.onEnd,
    required this.data,
    required this.child,
  });

  @override
  AnimatedWidgetBaseState<WxAnimatedTileTheme> createState() =>
      _AnimatedIconThemeState();
}

class _AnimatedIconThemeState
    extends AnimatedWidgetBaseState<WxAnimatedTileTheme> {
  WxTileThemeDataTween? _dataTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _dataTween = visitor(
      _dataTween,
      widget.data,
      (dynamic value) => WxTileThemeDataTween(begin: value),
    ) as WxTileThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    return WxTileTheme.merge(
      data: _dataTween?.evaluate(animation),
      child: widget.child,
    );
  }
}
