import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant tile should look like.
///
/// Descendant widgets obtain the current [WxTextTileThemeData] object using `TextTileTheme.of(context)`.
/// Instances of [WxTextTileThemeData] can be customized with [WxTextTileThemeData.copyWith] or [WxTextTileThemeData.merge].
class WxTextTileTheme extends InheritedTheme {
  /// The [WxTextTileThemeData] to be applied to descendant [TextTile]s
  final WxTextTileThemeData data;

  /// Creates a theme that controls
  /// how descendant [WxTextTileTheme]s should look like.
  const WxTextTileTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Creates an [WxTextTileTheme] that controls the style of
  /// descendant widgets, and merges in the current [WxTextTileTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    WxTextTileStyle? style,
    WxTextTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = WxTextTileTheme.of(context);
        return WxTextTileTheme(
          key: key,
          data: parent.merge(data).copyWith(style: style),
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
  /// TextTileThemeData style = TextTileTheme.of(context);
  /// ```
  static WxTextTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<WxTextTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<WxTextTileThemeData>();
    final defaultTheme = WxTextTileThemeData.fallback(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WxTextTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(WxTextTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}
