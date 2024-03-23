import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';
import '../text_tile/types.dart';

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

  /// {@template WxListTile.mainAxisExpanded}
  /// Controls whether to maximize or minimize the amount of free space.
  /// {@endtemplate}
  final bool? mainAxisExpanded;

  /// {@template WxListTile.textExpanded}
  /// Controls how the child widget (title and subtitle)
  /// fills its available space (expand or wrap content).
  /// {@endtemplate}
  ///
  final bool? textExpanded;

  /// {@template WxListTile.textAlign}
  /// How the title and subtitle should be placed along the cross axis.
  /// {@endtemplate}
  final WxTextTileAlign? textAlign;

  /// {@template WxListTile.textSpacing}
  /// The gap between the [title] and the [subtitle] widgets.
  /// {@endtemplate}
  final double? textSpacing;

  /// {@template WxListTile.titleStyle}
  /// The text style to be applied to title.
  /// {@endtemplate}
  final TextStyle? titleStyle;

  /// {@template WxListTile.subtitleStyle}
  /// The text style to be applied to subtitle.
  /// {@endtemplate}
  final TextStyle? subtitleStyle;

  /// Create a raw [WxListTileStyle]
  const WxListTileStyle({
    this.margin,
    this.padding,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.textExpanded,
    this.textAlign,
    this.textSpacing,
    this.titleStyle,
    this.subtitleStyle,
  });

  /// Create a [WxListTileStyle] with some reasonable default values.
  const WxListTileStyle.defaults()
      : margin = EdgeInsets.zero,
        padding = EdgeInsets.zero,
        spacing = 0.0,
        spacingEnforced = true,
        crossAxisAlignment = CrossAxisAlignment.center,
        mainAxisAlignment = MainAxisAlignment.start,
        mainAxisExpanded = true,
        textExpanded = true,
        textAlign = WxTextTileAlign.left,
        textSpacing = 0.0,
        titleStyle = null,
        subtitleStyle = null;

  /// Create a [WxListTileStyle] from another style
  WxListTileStyle.from(WxListTileStyle? other)
      : margin = other?.margin,
        padding = other?.padding,
        spacing = other?.spacing,
        spacingEnforced = other?.spacingEnforced,
        crossAxisAlignment = other?.crossAxisAlignment,
        mainAxisAlignment = other?.mainAxisAlignment,
        mainAxisExpanded = other?.mainAxisExpanded,
        textExpanded = other?.textExpanded,
        textAlign = other?.textAlign,
        textSpacing = other?.textSpacing,
        titleStyle = other?.titleStyle,
        subtitleStyle = other?.subtitleStyle;

  /// Creates a copy of this [WxListTileStyle] but with
  /// the given fields replaced with the new values.
  WxListTileStyle copyWith({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? spacing,
    bool? spacingEnforced,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    bool? mainAxisExpanded,
    bool? textExpanded,
    WxTextTileAlign? textAlign,
    double? textSpacing,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return WxListTileStyle(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      spacing: spacing ?? this.spacing,
      spacingEnforced: spacingEnforced ?? this.spacingEnforced,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisExpanded: mainAxisExpanded ?? this.mainAxisExpanded,
      textExpanded: textExpanded ?? this.textExpanded,
      textAlign: textAlign ?? this.textAlign,
      textSpacing: textSpacing ?? this.textSpacing,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
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
      mainAxisExpanded: other.mainAxisExpanded,
      textExpanded: other.textExpanded,
      textAlign: other.textAlign,
      textSpacing: other.textSpacing,
      titleStyle: other.titleStyle,
      subtitleStyle: other.subtitleStyle,
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
      mainAxisExpanded: lerpBool(a?.mainAxisExpanded, b?.mainAxisExpanded, t),
      textExpanded: lerpBool(a?.textExpanded, b?.textExpanded, t),
      textAlign: lerpEnum(a?.textAlign, b?.textAlign, t),
      textSpacing: lerpDouble(a?.textSpacing, b?.textSpacing, t),
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      subtitleStyle: TextStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'margin': margin,
        'padding': padding,
        'spacing': spacing,
        'spacingEnforced': spacingEnforced,
        'crossAxisAlignment': crossAxisAlignment,
        'mainAxisAlignment': mainAxisAlignment,
        'mainAxisExpanded': mainAxisExpanded,
        'childExpanded': textExpanded,
        'textAlign': textAlign,
        'textSpacing': textSpacing,
        'titleStyle': titleStyle,
        'subtitleStyle': subtitleStyle,
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
