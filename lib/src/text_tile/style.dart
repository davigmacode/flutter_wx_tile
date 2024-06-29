import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';

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
  final TextAlign? align;

  /// {@template WxTextTile.color}
  /// The text color to be applied to title and subtitle.
  /// {@endtemplate}
  final Color? color;

  /// {@template WxTextTile.titleStyle}
  /// The text style to be applied to title.
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template WxTextTile.titleColor}
  /// The text color to be applied to title.
  /// {@endtemplate}
  final Color? titleColor;

  /// {@template WxTextTile.titleSize}
  /// The font size to be applied to title.
  /// {@endtemplate}
  final double? titleSize;

  /// {@template WxTextTile.subtitleStyle}
  /// The text style to be applied to subtitle.
  /// {@endtemplate}
  final TextStyle? subtitleStyle;

  /// {@template WxTextTile.subtitleColor}
  /// The text color to be applied to subtitle.
  /// {@endtemplate}
  final Color? subtitleColor;

  /// {@template WxTextTile.subtitleSize}
  /// The font size to be applied to subtitle.
  /// {@endtemplate}
  final double? subtitleSize;

  /// Create a raw [WxTextTileStyle]
  const WxTextTileStyle({
    this.spacing,
    this.margin,
    this.align,
    this.color,
    this.titleStyle,
    this.titleColor,
    this.titleSize,
    this.subtitleStyle,
    this.subtitleColor,
    this.subtitleSize,
  });

  /// Create a [WxTextTileStyle] with default value
  const WxTextTileStyle.defaults()
      : spacing = 0.0,
        margin = EdgeInsets.zero,
        align = TextAlign.left,
        titleStyle = null,
        titleColor = null,
        titleSize = null,
        subtitleStyle = null,
        subtitleColor = null,
        subtitleSize = null,
        color = null;

  /// Create a [WxTextTileStyle] from another style
  WxTextTileStyle.from(WxTextTileStyle? other)
      : spacing = other?.spacing,
        margin = other?.margin,
        align = other?.align,
        titleStyle = other?.titleStyle,
        titleColor = other?.titleColor,
        titleSize = other?.titleSize,
        subtitleStyle = other?.subtitleStyle,
        subtitleColor = other?.subtitleColor,
        subtitleSize = other?.subtitleSize,
        color = other?.color;

  /// Creates a copy of this [WxTextTileStyle] but with
  /// the given fields replaced with the new values.
  WxTextTileStyle copyWith({
    double? spacing,
    EdgeInsetsGeometry? margin,
    TextAlign? align,
    Color? color,
    TextStyle? titleStyle,
    Color? titleColor,
    double? titleSize,
    TextStyle? subtitleStyle,
    Color? subtitleColor,
    double? subtitleSize,
  }) {
    return WxTextTileStyle(
      spacing: spacing ?? this.spacing,
      margin: margin ?? this.margin,
      align: align ?? this.align,
      color: color ?? this.color,
      titleStyle: titleStyle ?? this.titleStyle,
      titleColor: titleColor ?? this.titleColor,
      titleSize: titleSize ?? this.titleSize,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleSize: subtitleSize ?? this.subtitleSize,
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
      color: other.color,
      titleStyle: other.titleStyle,
      titleColor: other.titleColor,
      titleSize: other.titleSize,
      subtitleStyle: other.subtitleStyle,
      subtitleColor: other.subtitleColor,
      subtitleSize: other.subtitleSize,
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
      color: Color.lerp(a?.color, b?.color, t),
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      titleColor: Color.lerp(a?.titleColor, b?.titleColor, t),
      titleSize: lerpDouble(a?.titleSize, b?.titleSize, t),
      subtitleStyle: TextStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
      subtitleColor: Color.lerp(a?.subtitleColor, b?.subtitleColor, t),
      subtitleSize: lerpDouble(a?.subtitleSize, b?.subtitleSize, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'spacing': spacing,
        'margin': margin,
        'align': align,
        'color': color,
        'titleStyle': titleStyle,
        'titleColor': titleColor,
        'titleSize': titleSize,
        'subtitleStyle': subtitleStyle,
        'subtitleColor': subtitleColor,
        'subtitleSize': subtitleSize,
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
