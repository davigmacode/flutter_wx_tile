import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'wrapper.dart';

/// Defines the visual properties of [ListTile].
///
/// Descendant widgets obtain the current [WxListTileThemeData] object using
/// `ListTileTheme.of(context)`. Instances of [WxListTileThemeData]
/// can be customized with [WxListTileThemeData.copyWith] or [WxListTileThemeData.merge].
@immutable
class WxListTileThemeData extends ThemeExtension<WxListTileThemeData>
    with Diagnosticable {
  /// The [WxListTileStyle] to be applied to the [ListTile] widget
  final WxListTileStyle style;

  /// Called to build wrapper widget of the list tile
  final WxListTileBuilder? wrapper;

  /// Fallback to default builder if [wrapper] is `null`
  WxListTileBuilder get effectiveWrapper =>
      wrapper ?? WxListTileWrapper.inkWell();

  /// Creates a theme data that can be used for [ListTileTheme].
  const WxListTileThemeData({
    required this.style,
    this.wrapper,
  });

  /// An [WxListTileThemeData] with some reasonable default values.
  static const defaults = WxListTileThemeData(
    style: WxListTileStyle.defaults(),
  );

  /// Creates a [WxListTileThemeData] from another one that probably null.
  WxListTileThemeData.from([WxListTileThemeData? other])
      : style = defaults.style.merge(other?.style),
        wrapper = other?.wrapper;

  /// A [WxListTileThemeData] with default values.
  factory WxListTileThemeData.fallback(BuildContext context) => defaults;

  /// Creates a copy of this [WxListTileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  WxListTileThemeData copyWith({
    WxListTileStyle? style,
    WxListTileBuilder? wrapper,
  }) {
    return WxListTileThemeData(
      style: this.style.merge(style),
      wrapper: wrapper ?? this.wrapper,
    );
  }

  /// Creates a copy of this [WxListTileThemeData] but with
  /// the given fields replaced with the new values.
  WxListTileThemeData merge(WxListTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      style: other.style,
      wrapper: other.wrapper,
    );
  }

  @override
  WxListTileThemeData lerp(
    ThemeExtension<WxListTileThemeData>? other,
    double t,
  ) {
    if (other is! WxListTileThemeData) return this;
    return WxListTileThemeData(
      style: WxListTileStyle.lerp(style, other.style, t) ?? style,
      wrapper: other.wrapper,
    );
  }

  Map<String, dynamic> toMap() => {
        'style': style,
        'wrapper': wrapper,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxListTileThemeData && mapEquals(other.toMap(), toMap());
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
