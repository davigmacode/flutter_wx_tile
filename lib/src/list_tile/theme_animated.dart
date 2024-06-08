import 'package:flutter/material.dart';
import 'theme_data.dart';
import 'theme.dart';
import 'tween.dart';

/// A widget that animates the [WxListTileThemeData] implicitly.
class WxAnimatedListTileTheme extends ImplicitlyAnimatedWidget {
  /// The [WxListTileThemeData] to be applied to descendant [ListTile]s
  final WxListTileThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that animates the [data] implicitly.
  const WxAnimatedListTileTheme({
    super.key,
    super.curve = Curves.linear,
    super.duration = const Duration(milliseconds: 200),
    super.onEnd,
    required this.data,
    required this.child,
  });

  @override
  AnimatedWidgetBaseState<WxAnimatedListTileTheme> createState() =>
      _AnimatedListTileThemeState();
}

class _AnimatedListTileThemeState
    extends AnimatedWidgetBaseState<WxAnimatedListTileTheme> {
  WxListTileThemeDataTween? _dataTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _dataTween = visitor(
      _dataTween,
      widget.data,
      (dynamic value) => WxListTileThemeDataTween(begin: value),
    ) as WxListTileThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    return WxListTileTheme.merge(
      data: _dataTween?.evaluate(animation),
      child: widget.child,
    );
  }
}
