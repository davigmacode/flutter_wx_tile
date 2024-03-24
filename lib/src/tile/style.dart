import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';

/// The style to be applied to [WxTile] widget
@immutable
class WxTileStyle with Diagnosticable {
  /// {@template WxTile.direction}
  /// The direction to use as the main axis.
  /// {@endtemplate}
  final Axis? direction;

  /// {@template WxTile.margin}
  /// Outer space around the widget.
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@template WxTile.spacing}
  /// The gap between the [child] and the [leading]/[trailing] widgets.
  /// {@endtemplate}
  final double? spacing;

  /// {@template WxTile.spacingEnforced}
  /// Determines if spacing should be enforced
  /// between the child and leading/trailing widgets,
  /// even when leading/trailing widgets are absent.
  /// {@endtemplate}
  final bool? spacingEnforced;

  /// {@template WxTile.crossAxisAlignment}
  /// How the children should be placed along the cross axis.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template WxTile.mainAxisAlignment}
  /// How the children should be placed along the main axis.
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template WxTile.inline}
  /// Controls whether to minimize or maximize the amount of free space.
  /// {@endtemplate}
  final bool? inline;

  /// {@template WxTile.childExpanded}
  /// Controls how the child widget fills its available space (expand or wrap content).
  /// {@endtemplate}
  final bool? childExpanded;

  /// Create a raw [WxTileStyle]
  const WxTileStyle({
    this.direction,
    this.margin,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.inline,
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
        inline = true,
        childExpanded = false;

  /// Create a [WxTileStyle] from another style
  WxTileStyle.from(WxTileStyle? other)
      : direction = other?.direction,
        margin = other?.margin,
        spacing = other?.spacing,
        spacingEnforced = other?.spacingEnforced,
        crossAxisAlignment = other?.crossAxisAlignment,
        mainAxisAlignment = other?.mainAxisAlignment,
        inline = other?.inline,
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
    bool? inline,
    bool? childExpanded,
  }) {
    return WxTileStyle(
      direction: direction ?? this.direction,
      margin: margin ?? this.margin,
      spacing: spacing ?? this.spacing,
      spacingEnforced: spacingEnforced ?? this.spacingEnforced,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      inline: inline ?? this.inline,
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
      inline: other.inline,
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
      inline: lerpBool(a?.inline, b?.inline, t),
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
        'inline': inline,
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
