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

  /// {@template WxTextTile.overflow}
  /// The text overflow to be applied to title and subtitle.
  /// {@endtemplate}
  final TextOverflow? overflow;

  /// {@template WxTextTile.softWrap}
  /// The text softWrap to be applied to title and subtitle.
  /// {@endtemplate}
  final bool? softWrap;

  /// {@template WxTextTile.widthBasis}
  /// The text width basis to be applied to title and subtitle.
  /// {@endtemplate}
  final TextWidthBasis? widthBasis;

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

  /// {@template WxTextTile.titleMaxLines}
  /// The text max lines to be applied to title.
  /// {@endtemplate}
  final int? titleMaxLines;

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

  /// {@template WxTextTile.subtitleMaxLines}
  /// The text max lines to be applied to subtitle.
  /// {@endtemplate}
  final int? subtitleMaxLines;

  /// Create a raw [WxTextTileStyle]
  const WxTextTileStyle({
    this.spacing,
    this.margin,
    this.align,
    this.color,
    this.overflow,
    this.softWrap,
    this.widthBasis,
    this.titleStyle,
    this.titleColor,
    this.titleSize,
    this.titleMaxLines,
    this.subtitleStyle,
    this.subtitleColor,
    this.subtitleSize,
    this.subtitleMaxLines,
  });

  /// Create a [WxTextTileStyle] with default value
  const WxTextTileStyle.defaults()
      : spacing = 0.0,
        margin = EdgeInsets.zero,
        align = TextAlign.left,
        color = null,
        overflow = null,
        softWrap = null,
        widthBasis = null,
        titleStyle = null,
        titleColor = null,
        titleSize = null,
        titleMaxLines = null,
        subtitleStyle = null,
        subtitleColor = null,
        subtitleSize = null,
        subtitleMaxLines = null;

  /// Create a [WxTextTileStyle] from another style
  WxTextTileStyle.from(WxTextTileStyle? other)
      : spacing = other?.spacing,
        margin = other?.margin,
        align = other?.align,
        color = other?.color,
        overflow = other?.overflow,
        softWrap = other?.softWrap,
        widthBasis = other?.widthBasis,
        titleStyle = other?.titleStyle,
        titleColor = other?.titleColor,
        titleSize = other?.titleSize,
        titleMaxLines = other?.titleMaxLines,
        subtitleStyle = other?.subtitleStyle,
        subtitleColor = other?.subtitleColor,
        subtitleSize = other?.subtitleSize,
        subtitleMaxLines = other?.subtitleMaxLines;

  /// Creates a copy of this [WxTextTileStyle] but with
  /// the given fields replaced with the new values.
  WxTextTileStyle copyWith({
    double? spacing,
    EdgeInsetsGeometry? margin,
    TextAlign? align,
    Color? color,
    TextOverflow? overflow,
    bool? softWrap,
    TextWidthBasis? widthBasis,
    TextStyle? titleStyle,
    Color? titleColor,
    double? titleSize,
    int? titleMaxLines,
    TextStyle? subtitleStyle,
    Color? subtitleColor,
    double? subtitleSize,
    int? subtitleMaxLines,
  }) {
    return WxTextTileStyle(
      spacing: spacing ?? this.spacing,
      margin: margin ?? this.margin,
      align: align ?? this.align,
      color: color ?? this.color,
      overflow: overflow ?? this.overflow,
      softWrap: softWrap ?? this.softWrap,
      widthBasis: widthBasis ?? this.widthBasis,
      titleStyle: titleStyle ?? this.titleStyle,
      titleColor: titleColor ?? this.titleColor,
      titleSize: titleSize ?? this.titleSize,
      titleMaxLines: titleMaxLines ?? this.titleMaxLines,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      subtitleSize: subtitleSize ?? this.subtitleSize,
      subtitleMaxLines: subtitleMaxLines ?? this.subtitleMaxLines,
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
      overflow: other.overflow,
      softWrap: other.softWrap,
      widthBasis: other.widthBasis,
      titleStyle: other.titleStyle,
      titleColor: other.titleColor,
      titleSize: other.titleSize,
      titleMaxLines: other.titleMaxLines,
      subtitleStyle: other.subtitleStyle,
      subtitleColor: other.subtitleColor,
      subtitleSize: other.subtitleSize,
      subtitleMaxLines: other.subtitleMaxLines,
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
      overflow: lerpEnum(a?.overflow, b?.overflow, t),
      softWrap: lerpEnum(a?.softWrap, b?.softWrap, t),
      widthBasis: lerpEnum(a?.widthBasis, b?.widthBasis, t),
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      titleColor: Color.lerp(a?.titleColor, b?.titleColor, t),
      titleSize: lerpDouble(a?.titleSize, b?.titleSize, t),
      titleMaxLines: lerpInt(a?.titleMaxLines, b?.titleMaxLines, t),
      subtitleStyle: TextStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
      subtitleColor: Color.lerp(a?.subtitleColor, b?.subtitleColor, t),
      subtitleSize: lerpDouble(a?.subtitleSize, b?.subtitleSize, t),
      subtitleMaxLines: lerpInt(a?.subtitleMaxLines, b?.subtitleMaxLines, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'spacing': spacing,
        'margin': margin,
        'align': align,
        'color': color,
        'overflow': overflow,
        'softWrap': softWrap,
        'widthBasis': widthBasis,
        'titleStyle': titleStyle,
        'titleColor': titleColor,
        'titleSize': titleSize,
        'titleMaxLines': titleMaxLines,
        'subtitleStyle': subtitleStyle,
        'subtitleColor': subtitleColor,
        'subtitleSize': subtitleSize,
        'subtitleMaxLines': subtitleMaxLines,
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
