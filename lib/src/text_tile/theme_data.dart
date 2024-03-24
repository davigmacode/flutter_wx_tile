import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';

/// Defines the visual properties of [TextTile].
///
/// Descendant widgets obtain the current [WxTextTileThemeData] object using
/// `TextTileTheme.of(context)`. Instances of [WxTextTileThemeData]
/// can be customized with [WxTextTileThemeData.copyWith] or [WxTextTileThemeData.merge].
@immutable
class WxTextTileThemeData extends ThemeExtension<WxTextTileThemeData>
    with Diagnosticable {
  /// The [WxTextTileStyle] to be applied to the [TextTile] widget
  final WxTextTileStyle style;

  /// Creates a theme data that can be used for [TextTileTheme].
  const WxTextTileThemeData({required this.style});

  /// An [WxTextTileThemeData] with some reasonable default values.
  static const defaults = WxTextTileThemeData(
    style: WxTextTileStyle.defaults(),
  );

  /// Creates a [WxTextTileThemeData] from another one that probably null.
  WxTextTileThemeData.from([WxTextTileThemeData? other])
      : style = defaults.style.merge(other?.style);

  /// A [WxTextTileThemeData] with default values.
  factory WxTextTileThemeData.fallback(BuildContext context) => defaults;

  /// Creates a copy of this [WxTextTileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  WxTextTileThemeData copyWith({WxTextTileStyle? style}) {
    return WxTextTileThemeData(
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [WxTextTileThemeData] but with
  /// the given fields replaced with the new values.
  WxTextTileThemeData merge(WxTextTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      style: other.style,
    );
  }

  @override
  WxTextTileThemeData lerp(
    ThemeExtension<WxTextTileThemeData>? other,
    double t,
  ) {
    if (other is! WxTextTileThemeData) return this;
    return WxTextTileThemeData(
      style: WxTextTileStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {'style': style};

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxTextTileThemeData && mapEquals(other.toMap(), toMap());
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
