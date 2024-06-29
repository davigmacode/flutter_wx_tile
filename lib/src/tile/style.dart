import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';
import 'types.dart';

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

  /// {@template WxTile.adaptiveSpacing}
  /// Determines if spacing should not be enforced
  /// between the child and leading/trailing widgets,
  /// even when leading/trailing widgets are absent.
  /// {@endtemplate}
  final bool? adaptiveSpacing;

  /// {@template WxTile.align}
  /// How the children should be placed along the cross axis.
  /// {@endtemplate}
  final WxTileAlign? align;

  /// {@template WxTile.justify}
  /// How the children should be placed along the main axis.
  /// {@endtemplate}
  final WxTileJustify? justify;

  /// {@template WxTile.inline}
  /// Controls whether to minimize or maximize the amount of free space.
  /// {@endtemplate}
  final bool? inline;

  /// {@template WxTile.childWrap}
  /// Controls how the child widget fills its available space (expand or wrap content).
  /// {@endtemplate}
  final bool? childWrap;

  /// Create a raw [WxTileStyle]
  const WxTileStyle({
    this.direction,
    this.margin,
    this.spacing,
    this.adaptiveSpacing,
    this.align,
    this.justify,
    this.inline,
    this.childWrap,
  });

  /// Create a [WxTileStyle] with default value
  const WxTileStyle.defaults()
      : direction = Axis.horizontal,
        margin = EdgeInsets.zero,
        spacing = 0.0,
        adaptiveSpacing = false,
        align = WxTileAlign.center,
        justify = WxTileJustify.start,
        inline = true,
        childWrap = true;

  /// Create a [WxTileStyle] from another style
  WxTileStyle.from(WxTileStyle? other)
      : direction = other?.direction,
        margin = other?.margin,
        spacing = other?.spacing,
        adaptiveSpacing = other?.adaptiveSpacing,
        align = other?.align,
        justify = other?.justify,
        inline = other?.inline,
        childWrap = other?.childWrap;

  /// Creates a copy of this [WxTileStyle] but with
  /// the given fields replaced with the new values.
  WxTileStyle copyWith({
    Axis? direction,
    EdgeInsetsGeometry? margin,
    double? spacing,
    bool? adaptiveSpacing,
    WxTileAlign? align,
    WxTileJustify? justify,
    bool? inline,
    bool? childWrap,
  }) {
    return WxTileStyle(
      direction: direction ?? this.direction,
      margin: margin ?? this.margin,
      spacing: spacing ?? this.spacing,
      adaptiveSpacing: adaptiveSpacing ?? this.adaptiveSpacing,
      align: align ?? this.align,
      justify: justify ?? this.justify,
      inline: inline ?? this.inline,
      childWrap: childWrap ?? this.childWrap,
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
      adaptiveSpacing: other.adaptiveSpacing,
      align: other.align,
      justify: other.justify,
      inline: other.inline,
      childWrap: other.childWrap,
    );
  }

  /// Linearly interpolate between two [WxTileStyle] objects.
  static WxTileStyle? lerp(WxTileStyle? a, WxTileStyle? b, double t) {
    if (a == null && b == null) return null;
    return WxTileStyle(
      direction: lerpEnum(a?.direction, b?.direction, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      adaptiveSpacing: lerpBool(a?.adaptiveSpacing, b?.adaptiveSpacing, t),
      align: lerpEnum(a?.align, b?.align, t),
      justify: lerpEnum(a?.justify, b?.justify, t),
      inline: lerpBool(a?.inline, b?.inline, t),
      childWrap: lerpBool(a?.childWrap, b?.childWrap, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'direction': direction,
        'margin': margin,
        'spacing': spacing,
        'adaptiveSpacing': adaptiveSpacing,
        'align': align,
        'justify': justify,
        'inline': inline,
        'childWrap': childWrap,
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
