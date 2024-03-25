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
  final WxTextAlign? align;

  /// {@template WxTextTile.titleStyle}
  /// The text style to be applied to title.
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template WxTextTile.titleSize}
  /// The font size to be applied to title.
  /// {@endtemplate}
  final double? titleSize;

  /// {@template WxTextTile.subtitleStyle}
  /// The text style to be applied to subtitle.
  /// {@endtemplate}
  final TextStyle? subtitleStyle;

  /// {@template WxTextTile.subtitleSize}
  /// The font size to be applied to subtitle.
  /// {@endtemplate}
  final double? subtitleSize;

  /// {@template WxTextTile.textColor}
  /// The text color to be applied to title and subtitle.
  /// {@endtemplate}
  final Color? textColor;

  /// [CrossAxisAlignment] from [align]
  CrossAxisAlignment get crossAxisAlignment {
    switch (align) {
      case WxTextAlign.center:
        return CrossAxisAlignment.center;
      case WxTextAlign.right:
        return CrossAxisAlignment.end;
      case WxTextAlign.left:
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
    this.titleSize,
    this.subtitleStyle,
    this.subtitleSize,
    this.textColor,
  });

  /// Create a [WxTextTileStyle] with default value
  const WxTextTileStyle.defaults()
      : spacing = 0.0,
        margin = EdgeInsets.zero,
        align = WxTextAlign.left,
        titleStyle = null,
        titleSize = null,
        subtitleStyle = null,
        subtitleSize = null,
        textColor = null;

  /// Create a [WxTextTileStyle] from another style
  WxTextTileStyle.from(WxTextTileStyle? other)
      : spacing = other?.spacing,
        margin = other?.margin,
        align = other?.align,
        titleStyle = other?.titleStyle,
        titleSize = other?.titleSize,
        subtitleStyle = other?.subtitleStyle,
        subtitleSize = other?.subtitleSize,
        textColor = other?.textColor;

  /// Creates a copy of this [WxTextTileStyle] but with
  /// the given fields replaced with the new values.
  WxTextTileStyle copyWith({
    double? spacing,
    EdgeInsetsGeometry? margin,
    WxTextAlign? align,
    TextStyle? titleStyle,
    double? titleSize,
    TextStyle? subtitleStyle,
    double? subtitleSize,
    Color? textColor,
  }) {
    return WxTextTileStyle(
      spacing: spacing ?? this.spacing,
      margin: margin ?? this.margin,
      align: align ?? this.align,
      titleStyle: titleStyle ?? this.titleStyle,
      titleSize: titleSize ?? this.titleSize,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      subtitleSize: subtitleSize ?? this.subtitleSize,
      textColor: textColor ?? this.textColor,
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
      titleSize: other.titleSize,
      subtitleStyle: other.subtitleStyle,
      subtitleSize: other.subtitleSize,
      textColor: other.textColor,
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
      titleSize: lerpDouble(a?.titleSize, b?.titleSize, t),
      subtitleStyle: TextStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
      subtitleSize: lerpDouble(a?.subtitleSize, b?.subtitleSize, t),
      textColor: Color.lerp(a?.textColor, b?.textColor, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'spacing': spacing,
        'margin': margin,
        'align': align,
        'titleStyle': titleStyle,
        'titleSize': titleSize,
        'subtitleStyle': subtitleStyle,
        'subtitleSize': subtitleSize,
        'textColor': textColor,
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
