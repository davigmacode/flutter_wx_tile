import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant tile should look like.
///
/// Descendant widgets obtain the current [WxTileStyle] object using `TileTheme.of(context)`.
/// Instances of [WxTileStyle] can be customized with [WxTileStyle.copyWith] or [WxTileStyle.merge].
class WxTileTheme extends InheritedTheme {
  /// The [WxTileThemeData] to be applied to descendant [Tile]s
  final WxTileThemeData data;

  /// Creates a theme that controls
  /// how descendant [WxTileTheme]s should look like.
  const WxTileTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Creates an [WxTileTheme] that controls the style of
  /// descendant widgets, and merges in the current [WxTileTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    WxTileStyle? style,
    WxTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = WxTileTheme.of(context);
        return WxTileTheme(
          key: key,
          data: parent.merge(data).copyWith(style: style),
          child: child,
        );
      },
    );
  }

  /// The [WxTileThemeData] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TileThemeData theme = TileTheme.of(context);
  /// ```
  static WxTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<WxTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<WxTileThemeData>();
    final defaultTheme = WxTileThemeData.fallback(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WxTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(WxTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}
