import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';

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

  /// {@template WxListTile.spacingEnforced}
  /// Determines if spacing should be enforced
  /// between the text and leading/trailing widgets,
  /// even when leading/trailing widgets are absent.
  /// {@endtemplate}
  final bool? spacingEnforced;

  /// {@template WxListTile.crossAxisAlignment}
  /// How the children should be placed along the cross axis.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template WxListTile.mainAxisAlignment}
  /// How the children should be placed along the main axis.
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template WxListTile.inline}
  /// Controls whether to minimize or maximize the amount of free space.
  /// {@endtemplate}
  final bool? inline;

  /// {@template WxListTile.textExpanded}
  /// Controls how the child widget (title and subtitle)
  /// fills its available space (expand or wrap content).
  /// {@endtemplate}
  ///
  final bool? textExpanded;

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

  /// {@template WxListTile.iconColor}
  /// Defines the default color for [leading] and [trailing] icons.
  /// {@endtemplate}
  final Color? iconColor;

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

  /// Create a raw [WxListTileStyle]
  const WxListTileStyle({
    this.margin,
    this.padding,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.inline,
    this.textExpanded,
    this.textAlign,
    this.textSpacing,
    this.textColor,
    this.iconColor,
    this.titleStyle,
    this.subtitleStyle,
    this.secondaryStyle,
    this.titleSize,
    this.subtitleSize,
  });

  /// Create a [WxListTileStyle] with some reasonable default values.
  const WxListTileStyle.defaults()
      : margin = EdgeInsets.zero,
        padding = const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        spacing = 16.0,
        spacingEnforced = true,
        crossAxisAlignment = CrossAxisAlignment.center,
        mainAxisAlignment = MainAxisAlignment.spaceBetween,
        inline = false,
        textExpanded = true,
        textAlign = TextAlign.left,
        textSpacing = 0.0,
        textColor = null,
        iconColor = null,
        titleStyle = null,
        subtitleStyle = null,
        secondaryStyle = null,
        titleSize = null,
        subtitleSize = null;

  /// Create a [WxListTileStyle] with some reasonable default values.
  const WxListTileStyle.dense({
    this.margin,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.inline,
    this.textExpanded,
    this.textAlign,
    this.textSpacing,
    this.textColor,
    this.iconColor,
    this.titleStyle,
    this.subtitleStyle,
    this.secondaryStyle,
  })  : padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        spacing = 10.0,
        titleSize = 13.0,
        subtitleSize = 12.0;

  /// Create a [WxListTileStyle] from another style
  WxListTileStyle.from(WxListTileStyle? other)
      : margin = other?.margin,
        padding = other?.padding,
        spacing = other?.spacing,
        spacingEnforced = other?.spacingEnforced,
        crossAxisAlignment = other?.crossAxisAlignment,
        mainAxisAlignment = other?.mainAxisAlignment,
        inline = other?.inline,
        textExpanded = other?.textExpanded,
        textAlign = other?.textAlign,
        textSpacing = other?.textSpacing,
        textColor = other?.textColor,
        iconColor = other?.iconColor,
        titleStyle = other?.titleStyle,
        subtitleStyle = other?.subtitleStyle,
        secondaryStyle = other?.secondaryStyle,
        titleSize = other?.titleSize,
        subtitleSize = other?.subtitleSize;

  /// Creates a copy of this [WxListTileStyle] but with
  /// the given fields replaced with the new values.
  WxListTileStyle copyWith({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? spacing,
    bool? spacingEnforced,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    bool? inline,
    bool? textExpanded,
    TextAlign? textAlign,
    double? textSpacing,
    Color? textColor,
    Color? iconColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? secondaryStyle,
    double? titleSize,
    double? subtitleSize,
  }) {
    return WxListTileStyle(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      spacing: spacing ?? this.spacing,
      spacingEnforced: spacingEnforced ?? this.spacingEnforced,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      inline: inline ?? this.inline,
      textExpanded: textExpanded ?? this.textExpanded,
      textAlign: textAlign ?? this.textAlign,
      textSpacing: textSpacing ?? this.textSpacing,
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      secondaryStyle: secondaryStyle ?? this.secondaryStyle,
      titleSize: titleSize ?? this.titleSize,
      subtitleSize: subtitleSize ?? this.subtitleSize,
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
      spacingEnforced: other.spacingEnforced,
      crossAxisAlignment: other.crossAxisAlignment,
      mainAxisAlignment: other.mainAxisAlignment,
      inline: other.inline,
      textExpanded: other.textExpanded,
      textAlign: other.textAlign,
      textSpacing: other.textSpacing,
      textColor: other.textColor,
      iconColor: other.iconColor,
      titleStyle: other.titleStyle,
      subtitleStyle: other.subtitleStyle,
      secondaryStyle: other.secondaryStyle,
      titleSize: other.titleSize,
      subtitleSize: other.subtitleSize,
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
      spacingEnforced: lerpBool(a?.spacingEnforced, b?.spacingEnforced, t),
      crossAxisAlignment:
          lerpEnum(a?.crossAxisAlignment, b?.crossAxisAlignment, t),
      mainAxisAlignment:
          lerpEnum(a?.mainAxisAlignment, b?.mainAxisAlignment, t),
      inline: lerpBool(a?.inline, b?.inline, t),
      textExpanded: lerpBool(a?.textExpanded, b?.textExpanded, t),
      textAlign: lerpEnum(a?.textAlign, b?.textAlign, t),
      textSpacing: lerpDouble(a?.textSpacing, b?.textSpacing, t),
      textColor: Color.lerp(a?.textColor, b?.textColor, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      subtitleStyle: TextStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
      secondaryStyle: TextStyle.lerp(a?.secondaryStyle, b?.secondaryStyle, t),
      titleSize: lerpDouble(a?.titleSize, b?.titleSize, t),
      subtitleSize: lerpDouble(a?.subtitleSize, b?.subtitleSize, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'margin': margin,
        'padding': padding,
        'spacing': spacing,
        'spacingEnforced': spacingEnforced,
        'crossAxisAlignment': crossAxisAlignment,
        'mainAxisAlignment': mainAxisAlignment,
        'inline': inline,
        'childExpanded': textExpanded,
        'textAlign': textAlign,
        'textSpacing': textSpacing,
        'textColor': textColor,
        'iconColor': iconColor,
        'titleStyle': titleStyle,
        'subtitleStyle': subtitleStyle,
        'secondaryStyle': secondaryStyle,
        'titleSize': titleSize,
        'subtitleSize': subtitleSize,
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
