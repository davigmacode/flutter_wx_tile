import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';
import 'types.dart';

/// The style to be applied to [WxTextTile] widget
@immutable
class WxTextTileStyle with Diagnosticable {
  /// {@template WxTextTile.spacing}
  /// The gap between the [title] and the [subtitle] widgets.
  /// {@endtemplate}
  final double? spacing;

  /// {@template WxTextTile.margin}
  /// Outer space around the widget.
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@template WxTextTile.align}
  /// How the title and subtitle should be placed along the cross axis.
  /// {@endtemplate}
  final WxTextTileAlign? align;

  /// {@template WxTextTile.titleStyle}
  /// The text style to be applied to title.
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template WxTextTile.subtitleStyle}
  /// The text style to be applied to subtitle.
  /// {@endtemplate}
  final TextStyle? subtitleStyle;

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
    this.titleStyle,
    this.subtitleStyle,
  });

  /// Create a [WxTextTileStyle] with default value
  const WxTextTileStyle.defaults()
      : spacing = 0.0,
        margin = EdgeInsets.zero,
        align = WxTextTileAlign.left,
        titleStyle = null,
        subtitleStyle = null;

  /// Create a [WxTextTileStyle] from another style
  WxTextTileStyle.from(WxTextTileStyle? other)
      : spacing = other?.spacing,
        margin = other?.margin,
        align = other?.align,
        titleStyle = other?.titleStyle,
        subtitleStyle = other?.subtitleStyle;

  /// Creates a copy of this [WxTextTileStyle] but with
  /// the given fields replaced with the new values.
  WxTextTileStyle copyWith({
    double? spacing,
    EdgeInsetsGeometry? margin,
    WxTextTileAlign? align,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return WxTextTileStyle(
      spacing: spacing ?? this.spacing,
      margin: margin ?? this.margin,
      align: align ?? this.align,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: titleStyle ?? this.subtitleStyle,
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
      titleStyle: other.titleStyle,
      subtitleStyle: other.titleStyle,
    );
  }

  /// Linearly interpolate between two [WxTextTileStyle] objects.
  static WxTextTileStyle? lerp(
    WxTextTileStyle? a,
    WxTextTileStyle? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    return WxTextTileStyle(
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      align: lerpEnum(a?.align, b?.align, t),
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      subtitleStyle: TextStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'spacing': spacing,
        'margin': margin,
        'align': align,
        'titleStyle': titleStyle,
        'subtitleStyle': subtitleStyle,
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
