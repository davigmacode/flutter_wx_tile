import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:lerp/lerp.dart';
import '../text_tile/types.dart';

/// The style to be applied to [ListTile] widget
@immutable
class WxListTileStyle with Diagnosticable {
  final EdgeInsetsGeometry? margin;
  final double? spacing;
  final bool? spacingEnforced;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? mainAxisExpanded;
  final bool? textExpanded;
  final WxTextTileAlign? textAlign;
  final double? textSpacing;
  final EdgeInsetsGeometry? textMargin;

  /// Create a raw [WxListTileStyle]
  const WxListTileStyle({
    this.margin,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.textExpanded,
    this.textAlign,
    this.textSpacing,
    this.textMargin,
  });

  /// Create a [WxListTileStyle] with some reasonable default values.
  const WxListTileStyle.defaults()
      : margin = EdgeInsets.zero,
        spacing = 0.0,
        spacingEnforced = true,
        crossAxisAlignment = CrossAxisAlignment.center,
        mainAxisAlignment = MainAxisAlignment.start,
        mainAxisExpanded = true,
        textExpanded = true,
        textAlign = WxTextTileAlign.left,
        textMargin = EdgeInsets.zero,
        textSpacing = 0.0;

  /// Create a [WxListTileStyle] from another style
  WxListTileStyle.from(WxListTileStyle? other)
      : margin = other?.margin,
        spacing = other?.spacing,
        spacingEnforced = other?.spacingEnforced,
        crossAxisAlignment = other?.crossAxisAlignment,
        mainAxisAlignment = other?.mainAxisAlignment,
        mainAxisExpanded = other?.mainAxisExpanded,
        textExpanded = other?.textExpanded,
        textAlign = other?.textAlign,
        textMargin = other?.textMargin,
        textSpacing = other?.textSpacing;

  /// Creates a copy of this [WxListTileStyle] but with
  /// the given fields replaced with the new values.
  WxListTileStyle copyWith({
    EdgeInsetsGeometry? margin,
    double? spacing,
    bool? spacingEnforced,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    bool? mainAxisExpanded,
    bool? textExpanded,
    WxTextTileAlign? textAlign,
    double? textSpacing,
    EdgeInsetsGeometry? textMargin,
  }) {
    return WxListTileStyle(
      margin: margin ?? this.margin,
      spacing: spacing ?? this.spacing,
      spacingEnforced: spacingEnforced ?? this.spacingEnforced,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisExpanded: mainAxisExpanded ?? this.mainAxisExpanded,
      textExpanded: textExpanded ?? this.textExpanded,
      textAlign: textAlign ?? this.textAlign,
      textSpacing: textSpacing ?? this.textSpacing,
      textMargin: textMargin ?? this.textMargin,
    );
  }

  /// Creates a copy of this [WxListTileStyle] but with
  /// the given fields replaced with the new values.
  WxListTileStyle merge(WxListTileStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      margin: other.margin,
      spacing: other.spacing,
      spacingEnforced: other.spacingEnforced,
      crossAxisAlignment: other.crossAxisAlignment,
      mainAxisAlignment: other.mainAxisAlignment,
      mainAxisExpanded: other.mainAxisExpanded,
      textExpanded: other.textExpanded,
      textAlign: other.textAlign,
      textMargin: other.textMargin,
      textSpacing: other.textSpacing,
    );
  }

  /// Linearly interpolate between two [WxListTileStyle] objects.
  static WxListTileStyle? lerp(
      WxListTileStyle? a, WxListTileStyle? b, double t) {
    if (a == null && b == null) return null;
    return WxListTileStyle(
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      spacingEnforced: lerpBool(a?.spacingEnforced, b?.spacingEnforced, t),
      crossAxisAlignment:
          lerpEnum(a?.crossAxisAlignment, b?.crossAxisAlignment, t),
      mainAxisAlignment:
          lerpEnum(a?.mainAxisAlignment, b?.mainAxisAlignment, t),
      mainAxisExpanded: lerpBool(a?.mainAxisExpanded, b?.mainAxisExpanded, t),
      textExpanded: lerpBool(a?.textExpanded, b?.textExpanded, t),
      textAlign: lerpEnum(a?.textAlign, b?.textAlign, t),
      textMargin: EdgeInsetsGeometry.lerp(a?.textMargin, b?.textMargin, t),
      textSpacing: lerpDouble(a?.textSpacing, b?.textSpacing, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'margin': margin,
        'spacing': spacing,
        'spacingEnforced': spacingEnforced,
        'crossAxisAlignment': crossAxisAlignment,
        'mainAxisAlignment': mainAxisAlignment,
        'mainAxisExpanded': mainAxisExpanded,
        'childExpanded': textExpanded,
        'textAlign': textAlign,
        'textMargin': textMargin,
        'textSpacing': textSpacing,
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
