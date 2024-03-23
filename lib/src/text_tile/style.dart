import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';
import 'types.dart';

/// The style to be applied to [TextTile] widget
@immutable
class WxTextTileStyle with Diagnosticable {
  final double? spacing;
  final EdgeInsetsGeometry? margin;
  final WxTextTileAlign? align;

  /// [CrossAxisAlignment] from [align]
  CrossAxisAlignment get crossAxisAlignment {
    switch (align) {
      case WxTextTileAlign.center:
        return CrossAxisAlignment.center;
      case WxTextTileAlign.right:
        return CrossAxisAlignment.end;
      case WxTextTileAlign.left:
      default:
        return CrossAxisAlignment.start;
    }
  }

  /// Create a raw [WxTextTileStyle]
  const WxTextTileStyle({
    this.spacing,
    this.margin,
    this.align,
  });

  /// Create a [WxTextTileStyle] with default value
  const WxTextTileStyle.defaults()
      : spacing = 0.0,
        margin = EdgeInsets.zero,
        align = WxTextTileAlign.left;

  /// Create a [WxTextTileStyle] from another style
  WxTextTileStyle.from(WxTextTileStyle? other)
      : spacing = other?.spacing,
        margin = other?.margin,
        align = other?.align;

  /// Creates a copy of this [WxTextTileStyle] but with
  /// the given fields replaced with the new values.
  WxTextTileStyle copyWith({
    double? spacing,
    EdgeInsetsGeometry? margin,
    WxTextTileAlign? align,
  }) {
    return WxTextTileStyle(
      spacing: spacing ?? this.spacing,
      margin: margin ?? this.margin,
      align: align ?? this.align,
    );
  }

  /// Creates a copy of this [WxTextTileStyle] but with
  /// the given fields replaced with the new values.
  WxTextTileStyle merge(WxTextTileStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      spacing: other.spacing,
      margin: other.margin,
      align: other.align,
    );
  }

  /// Linearly interpolate between two [WxTextTileStyle] objects.
  static WxTextTileStyle? lerp(
      WxTextTileStyle? a, WxTextTileStyle? b, double t) {
    if (a == null && b == null) return null;
    return WxTextTileStyle(
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      align: lerpEnum(a?.align, b?.align, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'spacing': spacing,
        'margin': margin,
        'align': align,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxTextTileStyle && mapEquals(other.toMap(), toMap());
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
