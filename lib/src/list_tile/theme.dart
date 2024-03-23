import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant tile should look like.
///
/// Descendant widgets obtain the current [WxListTileThemeData] object using `ListTileTheme.of(context)`.
/// Instances of [WxListTileThemeData] can be customized with [WxListTileThemeData.copyWith] or [WxListTileThemeData.merge].
class WxListTileTheme extends InheritedTheme {
  /// The [WxListTileThemeData] to be applied to descendant [ListTile]s
  final WxListTileThemeData data;

  /// Creates a theme that controls
  /// how descendant [WxListTileTheme]s should look like.
  const WxListTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [WxListTileTheme] that controls the style of
  /// descendant widgets, and merges in the current [WxListTileTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    WxListTileStyle? style,
    WxListTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = WxListTileTheme.of(context);
        return WxListTileTheme(
          key: key,
          data: parent.merge(data),
          child: child,
        );
      },
    );
  }

  /// The [data] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ListTileThemeData data = ListTileTheme.of(context);
  /// ```
  static WxListTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<WxListTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<WxListTileThemeData>();
    final defaultTheme = WxListTileThemeData.fallback(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WxListTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(WxListTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}
