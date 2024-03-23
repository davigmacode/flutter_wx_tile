import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';

/// The style to be applied to [Tile] widget
@immutable
class WxTileStyle with Diagnosticable {
  final Axis? direction;
  final EdgeInsetsGeometry? margin;
  final double? spacing;
  final bool? spacingEnforced;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? mainAxisExpanded;
  final bool? childExpanded;

  /// Create a raw [WxTileStyle]
  const WxTileStyle({
    this.direction,
    this.margin,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.childExpanded,
  });

  /// Create a [WxTileStyle] with default value
  const WxTileStyle.defaults()
      : direction = Axis.horizontal,
        margin = EdgeInsets.zero,
        spacing = 0.0,
        spacingEnforced = false,
        crossAxisAlignment = CrossAxisAlignment.center,
        mainAxisAlignment = MainAxisAlignment.start,
        mainAxisExpanded = false,
        childExpanded = false;

  /// Create a [WxTileStyle] from another style
  WxTileStyle.from(WxTileStyle? other)
      : direction = other?.direction,
        margin = other?.margin,
        spacing = other?.spacing,
        spacingEnforced = other?.spacingEnforced,
        crossAxisAlignment = other?.crossAxisAlignment,
        mainAxisAlignment = other?.mainAxisAlignment,
        mainAxisExpanded = other?.mainAxisExpanded,
        childExpanded = other?.childExpanded;

  /// Creates a copy of this [WxTileStyle] but with
  /// the given fields replaced with the new values.
  WxTileStyle copyWith({
    Axis? direction,
    EdgeInsetsGeometry? margin,
    double? spacing,
    bool? spacingEnforced,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    bool? mainAxisExpanded,
    bool? childExpanded,
  }) {
    return WxTileStyle(
      direction: direction ?? this.direction,
      margin: margin ?? this.margin,
      spacing: spacing ?? this.spacing,
      spacingEnforced: spacingEnforced ?? this.spacingEnforced,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisExpanded: mainAxisExpanded ?? this.mainAxisExpanded,
      childExpanded: childExpanded ?? this.childExpanded,
    );
  }

  /// Creates a copy of this [WxTileStyle] but with
  /// the given fields replaced with the new values.
  WxTileStyle merge(WxTileStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      direction: other.direction,
      margin: other.margin,
      spacing: other.spacing,
      spacingEnforced: other.spacingEnforced,
      crossAxisAlignment: other.crossAxisAlignment,
      mainAxisAlignment: other.mainAxisAlignment,
      mainAxisExpanded: other.mainAxisExpanded,
      childExpanded: other.childExpanded,
    );
  }

  /// Linearly interpolate between two [WxTileStyle] objects.
  static WxTileStyle? lerp(WxTileStyle? a, WxTileStyle? b, double t) {
    if (a == null && b == null) return null;
    return WxTileStyle(
      direction: lerpEnum(a?.direction, b?.direction, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      spacingEnforced: lerpBool(a?.spacingEnforced, b?.spacingEnforced, t),
      crossAxisAlignment:
          lerpEnum(a?.crossAxisAlignment, b?.crossAxisAlignment, t),
      mainAxisAlignment:
          lerpEnum(a?.mainAxisAlignment, b?.mainAxisAlignment, t),
      mainAxisExpanded: lerpBool(a?.mainAxisExpanded, b?.mainAxisExpanded, t),
      childExpanded: lerpBool(a?.childExpanded, b?.childExpanded, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'direction': direction,
        'margin': margin,
        'spacing': spacing,
        'spacingEnforced': spacingEnforced,
        'crossAxisAlignment': crossAxisAlignment,
        'mainAxisAlignment': mainAxisAlignment,
        'mainAxisExpanded': mainAxisExpanded,
        'childExpanded': childExpanded,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxTileStyle && mapEquals(other.toMap(), toMap());
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
