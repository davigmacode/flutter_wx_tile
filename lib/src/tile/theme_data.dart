import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';

/// Defines the visual properties of [Tile].
///
/// Descendant widgets obtain the current [WxTileThemeData] object using
/// `TileTheme.of(context)`. Instances of [WxTileThemeData]
/// can be customized with [WxTileThemeData.copyWith] or [WxTileThemeData.merge].
@immutable
class WxTileThemeData extends ThemeExtension<WxTileThemeData>
    with Diagnosticable {
  /// The [WxTileStyle] to be applied to the [Tile] widget
  final WxTileStyle style;

  /// Creates a theme data that can be used for [TileTheme].
  const WxTileThemeData({required this.style});

  /// An [WxTileThemeData] with some reasonable default values.
  static const defaults = WxTileThemeData(style: WxTileStyle.defaults());

  /// Creates a [WxTileThemeData] from another one that probably null.
  WxTileThemeData.from([WxTileThemeData? other])
      : style = defaults.style.merge(other?.style);

  /// A [WxTileThemeData] with default values.
  factory WxTileThemeData.fallback(BuildContext context) => defaults;

  /// Creates a copy of this [WxTileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  WxTileThemeData copyWith({WxTileStyle? style}) {
    return WxTileThemeData(
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [WxTileThemeData] but with
  /// the given fields replaced with the new values.
  WxTileThemeData merge(WxTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      style: other.style,
    );
  }

  @override
  WxTileThemeData lerp(ThemeExtension<WxTileThemeData>? other, double t) {
    if (other is! WxTileThemeData) return this;
    return WxTileThemeData(
      style: WxTileStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {'style': style};

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxTileThemeData && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    toMap().entries.forEach((el) {
      properties.add(DiagnosticsProperty(el.key, el.value, defaultValue: null));
    });
  }
}
