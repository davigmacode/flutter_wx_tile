import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';
import '../tile/types.dart';

/// The style to be applied to [WxListTile] widget
@immutable
class WxListTileStyle with Diagnosticable {
  /// {@template WxListTile.margin}
  /// Outer space around the widget.
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@template WxListTile.padding}
  /// The amount of space by which to inset the child.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template WxListTile.spacing}
  /// The gap between the text and the [leading]/[trailing] widgets.
  /// {@endtemplate}
  final double? spacing;

  /// {@template WxListTile.adaptiveSpacing}
  /// Determines if spacing should not be enforced
  /// between the text and leading/trailing widgets,
  /// even when leading/trailing widgets are absent.
  /// {@endtemplate}
  final bool? adaptiveSpacing;

  /// {@template WxListTile.align}
  /// How the children should be placed along the cross axis.
  /// {@endtemplate}
  final WxTileAlign? align;

  /// {@template WxListTile.justify}
  /// How the children should be placed along the main axis.
  /// {@endtemplate}
  final WxTileJustify? justify;

  /// {@template WxListTile.inline}
  /// Controls whether to minimize or maximize the amount of free space.
  /// {@endtemplate}
  final bool? inline;

  /// {@template WxListTile.textWrap}
  /// Controls how the child widget (title and subtitle)
  /// fills its available space (expand or wrap content).
  /// {@endtemplate}
  ///
  final bool? textWrap;

  /// {@template WxListTile.textAlign}
  /// How the title and subtitle should be placed along the cross axis.
  /// {@endtemplate}
  final TextAlign? textAlign;

  /// {@template WxListTile.textSpacing}
  /// The gap between the [title] and the [subtitle] widgets.
  /// {@endtemplate}
  final double? textSpacing;

  /// {@template WxListTile.textColor}
  /// The text color to be applied to title and subtitle.
  /// {@endtemplate}
  final Color? textColor;

  /// {@template WxListTile.textOverflow}
  /// The text overflow to be applied to title and subtitle.
  /// {@endtemplate}
  final TextOverflow? textOverflow;

  /// {@template WxListTile.textSoftWrap}
  /// The text softWrap to be applied to title and subtitle.
  /// {@endtemplate}
  final bool? textSoftWrap;

  /// {@template WxListTile.textWidthBasis}
  /// The text width basis to be applied to title and subtitle.
  /// {@endtemplate}
  final TextWidthBasis? textWidthBasis;

  /// {@template WxListTile.iconColor}
  /// Defines the default color for icons.
  /// {@endtemplate}
  final Color? iconColor;

  /// {@template WxListTile.iconOpacity}
  /// Defines the default opacity for icons.
  /// {@endtemplate}
  final double? iconOpacity;

  /// {@template WxListTile.iconSize}
  /// Defines the default size for icons.
  /// {@endtemplate}
  final double? iconSize;

  /// {@template WxListTile.titleStyle}
  /// The text style to be applied to title.
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template WxListTile.subtitleStyle}
  /// The text style to be applied to subtitle.
  /// {@endtemplate}
  final TextStyle? subtitleStyle;

  /// {@template WxListTile.secondaryStyle}
  /// The text style to be applied to leading and trailing.
  /// {@endtemplate}
  final TextStyle? secondaryStyle;

  /// {@template WxListTile.titleSize}
  /// The font size to be applied to title.
  /// {@endtemplate}
  final double? titleSize;

  /// {@template WxListTile.subtitleSize}
  /// The font size to be applied to title.
  /// {@endtemplate}
  final double? subtitleSize;

  /// {@template WxListTile.titleColor}
  /// The text color to be applied to title.
  /// {@endtemplate}
  final Color? titleColor;

  /// {@template WxListTile.subtitleColor}
  /// The text color to be applied to subtitle.
  /// {@endtemplate}
  final Color? subtitleColor;

  /// {@template WxListTile.titleMaxLines}
  /// The text max lines to be applied to title.
  /// {@endtemplate}
  final int? titleMaxLines;

  /// {@template WxListTile.subtitleMaxLines}
  /// The text max lines to be applied to subtitle.
  /// {@endtemplate}
  final int? subtitleMaxLines;

  /// {@template WxListTile.titleWeight}
  /// The font weight to be applied to title.
  /// {@endtemplate}
  final FontWeight? titleWeight;

  /// {@template WxListTile.subtitleWeight}
  /// The font weight to be applied to subtitle.
  /// {@endtemplate}
  final FontWeight? subtitleWeight;

  /// Create a raw [WxListTileStyle]
  const WxListTileStyle({
    this.margin,
    this.padding,
    this.spacing,
    this.adaptiveSpacing,
    this.align,
    this.justify,
    this.inline,
    this.textWrap,
    this.textAlign,
    this.textSpacing,
    this.textColor,
    this.textOverflow,
    this.textSoftWrap,
    this.textWidthBasis,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
    this.titleStyle,
    this.subtitleStyle,
    this.secondaryStyle,
    this.titleSize,
    this.subtitleSize,
    this.titleColor,
    this.subtitleColor,
    this.titleMaxLines,
    this.subtitleMaxLines,
    this.titleWeight,
    this.subtitleWeight,
  });

  /// Create a [WxListTileStyle] with some reasonable default values.
  const WxListTileStyle.defaults()
      : margin = EdgeInsets.zero,
        padding = const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        spacing = 16.0,
        adaptiveSpacing = true,
        align = WxTileAlign.center,
        justify = WxTileJustify.spaceBetween,
        inline = false,
        textWrap = false,
        textAlign = TextAlign.left,
        textSpacing = 0.0,
        textColor = null,
        textOverflow = null,
        textSoftWrap = null,
        textWidthBasis = null,
        iconColor = null,
        iconOpacity = null,
        iconSize = null,
        titleStyle = null,
        subtitleStyle = null,
        secondaryStyle = null,
        titleSize = null,
        subtitleSize = null,
        titleColor = null,
        subtitleColor = null,
        titleMaxLines = null,
        subtitleMaxLines = null,
        titleWeight = null,
        subtitleWeight = null;

  /// Create a [WxListTileStyle] with some reasonable default values.
  const WxListTileStyle.dense({
    this.margin,
    this.adaptiveSpacing,
    this.align,
    this.justify,
    this.inline,
    this.textWrap,
    this.textAlign,
    this.textSpacing,
    this.textColor,
    this.textOverflow,
    this.textSoftWrap,
    this.textWidthBasis,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
    this.titleStyle,
    this.subtitleStyle,
    this.secondaryStyle,
    this.titleColor,
    this.subtitleColor,
    this.titleMaxLines,
    this.subtitleMaxLines,
    this.titleWeight,
    this.subtitleWeight,
  })  : padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        spacing = 10.0,
        titleSize = 13.0,
        subtitleSize = 12.0;

  /// Create a [WxListTileStyle] from another style
  WxListTileStyle.from(WxListTileStyle? other)
      : margin = other?.margin,
        padding = other?.padding,
        spacing = other?.spacing,
        adaptiveSpacing = other?.adaptiveSpacing,
        align = other?.align,
        justify = other?.justify,
        inline = other?.inline,
        textWrap = other?.textWrap,
        textAlign = other?.textAlign,
        textSpacing = other?.textSpacing,
        textColor = other?.textColor,
        textOverflow = other?.textOverflow,
        textSoftWrap = other?.textSoftWrap,
        textWidthBasis = other?.textWidthBasis,
        iconColor = other?.iconColor,
        iconOpacity = other?.iconOpacity,
        iconSize = other?.iconSize,
        titleStyle = other?.titleStyle,
        subtitleStyle = other?.subtitleStyle,
        secondaryStyle = other?.secondaryStyle,
        titleSize = other?.titleSize,
        subtitleSize = other?.subtitleSize,
        titleColor = other?.titleColor,
        subtitleColor = other?.subtitleColor,
        titleMaxLines = other?.titleMaxLines,
        subtitleMaxLines = other?.subtitleMaxLines,
        titleWeight = other?.titleWeight,
        subtitleWeight = other?.subtitleWeight;

  /// Creates a copy of this [WxListTileStyle] but with
  /// the given fields replaced with the new values.
  WxListTileStyle copyWith({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? spacing,
    bool? adaptiveSpacing,
    WxTileAlign? align,
    WxTileJustify? justify,
    bool? inline,
    bool? textWrap,
    TextAlign? textAlign,
    double? textSpacing,
    Color? textColor,
    TextOverflow? textOverflow,
    bool? textSoftWrap,
    TextWidthBasis? textWidthBasis,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? secondaryStyle,
    double? titleSize,
    double? subtitleSize,
    Color? titleColor,
    Color? subtitleColor,
    int? titleMaxLines,
    int? subtitleMaxLines,
    FontWeight? titleWeight,
    FontWeight? subtitleWeight,
  }) {
    return WxListTileStyle(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      spacing: spacing ?? this.spacing,
      adaptiveSpacing: adaptiveSpacing ?? this.adaptiveSpacing,
      align: align ?? this.align,
      justify: justify ?? this.justify,
      inline: inline ?? this.inline,
      textWrap: textWrap ?? this.textWrap,
      textAlign: textAlign ?? this.textAlign,
      textSpacing: textSpacing ?? this.textSpacing,
      textColor: textColor ?? this.textColor,
      textOverflow: textOverflow ?? this.textOverflow,
      textSoftWrap: textSoftWrap ?? this.textSoftWrap,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      secondaryStyle: secondaryStyle ?? this.secondaryStyle,
      titleSize: titleSize ?? this.titleSize,
      subtitleSize: subtitleSize ?? this.subtitleSize,
      titleColor: titleColor ?? this.titleColor,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      titleMaxLines: titleMaxLines ?? this.titleMaxLines,
      subtitleMaxLines: subtitleMaxLines ?? this.subtitleMaxLines,
      titleWeight: titleWeight ?? this.titleWeight,
      subtitleWeight: subtitleWeight ?? this.subtitleWeight,
    );
  }

  /// Creates a copy of this [WxListTileStyle] but with
  /// the given fields replaced with the new values.
  WxListTileStyle merge(WxListTileStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      margin: other.margin,
      padding: other.padding,
      spacing: other.spacing,
      adaptiveSpacing: other.adaptiveSpacing,
      align: other.align,
      justify: other.justify,
      inline: other.inline,
      textWrap: other.textWrap,
      textAlign: other.textAlign,
      textSpacing: other.textSpacing,
      textColor: other.textColor,
      textOverflow: other.textOverflow,
      textSoftWrap: other.textSoftWrap,
      textWidthBasis: other.textWidthBasis,
      iconColor: other.iconColor,
      iconOpacity: other.iconOpacity,
      iconSize: other.iconSize,
      titleStyle: other.titleStyle,
      subtitleStyle: other.subtitleStyle,
      secondaryStyle: other.secondaryStyle,
      titleSize: other.titleSize,
      subtitleSize: other.subtitleSize,
      titleColor: other.titleColor,
      subtitleColor: other.subtitleColor,
      titleMaxLines: other.titleMaxLines,
      subtitleMaxLines: other.subtitleMaxLines,
      titleWeight: other.titleWeight,
      subtitleWeight: other.subtitleWeight,
    );
  }

  /// Linearly interpolate between two [WxListTileStyle] objects.
  static WxListTileStyle? lerp(
    WxListTileStyle? a,
    WxListTileStyle? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    return WxListTileStyle(
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      adaptiveSpacing: lerpBool(a?.adaptiveSpacing, b?.adaptiveSpacing, t),
      align: lerpEnum(a?.align, b?.align, t),
      justify: lerpEnum(a?.justify, b?.justify, t),
      inline: lerpBool(a?.inline, b?.inline, t),
      textWrap: lerpBool(a?.textWrap, b?.textWrap, t),
      textAlign: lerpEnum(a?.textAlign, b?.textAlign, t),
      textSpacing: lerpDouble(a?.textSpacing, b?.textSpacing, t),
      textColor: Color.lerp(a?.textColor, b?.textColor, t),
      textOverflow: lerpEnum(a?.textOverflow, b?.textOverflow, t),
      textSoftWrap: lerpEnum(a?.textSoftWrap, b?.textSoftWrap, t),
      textWidthBasis: lerpEnum(a?.textWidthBasis, b?.textWidthBasis, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      iconOpacity: lerpDouble(a?.iconOpacity, b?.iconOpacity, t),
      iconSize: lerpDouble(a?.iconSize, b?.iconSize, t),
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      subtitleStyle: TextStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
      secondaryStyle: TextStyle.lerp(a?.secondaryStyle, b?.secondaryStyle, t),
      titleSize: lerpDouble(a?.titleSize, b?.titleSize, t),
      subtitleSize: lerpDouble(a?.subtitleSize, b?.subtitleSize, t),
      titleColor: Color.lerp(a?.titleColor, b?.titleColor, t),
      subtitleColor: Color.lerp(a?.subtitleColor, b?.subtitleColor, t),
      titleMaxLines: lerpInt(a?.titleMaxLines, b?.titleMaxLines, t),
      subtitleMaxLines: lerpInt(a?.subtitleMaxLines, b?.subtitleMaxLines, t),
      titleWeight: FontWeight.lerp(a?.titleWeight, b?.titleWeight, t),
      subtitleWeight: FontWeight.lerp(a?.subtitleWeight, b?.subtitleWeight, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'margin': margin,
        'padding': padding,
        'spacing': spacing,
        'adaptiveSpacing': adaptiveSpacing,
        'align': align,
        'justify': justify,
        'inline': inline,
        'textWrap': textWrap,
        'textAlign': textAlign,
        'textSpacing': textSpacing,
        'textColor': textColor,
        'textOverflow': textOverflow,
        'textSoftWrap': textSoftWrap,
        'textWidthBasis': textWidthBasis,
        'iconColor': iconColor,
        'iconOpacity': iconOpacity,
        'iconSize': iconSize,
        'titleStyle': titleStyle,
        'subtitleStyle': subtitleStyle,
        'secondaryStyle': secondaryStyle,
        'titleSize': titleSize,
        'subtitleSize': subtitleSize,
        'titleColor': titleColor,
        'subtitleColor': subtitleColor,
        'titleMaxLines': titleMaxLines,
        'subtitleMaxLines': subtitleMaxLines,
        'titleWeight': titleWeight,
        'subtitleWeight': subtitleWeight,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxListTileStyle && mapEquals(other.toMap(), toMap());
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
