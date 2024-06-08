import 'package:flutter/animation.dart';
import 'style.dart';
import 'theme_data.dart';

/// An interpolation between two [WxTileStyle]s.
///
/// This class specializes the interpolation of [Tween] to use [WxTileStyle.lerp].
class WxTileStyleTween extends Tween<WxTileStyle?> {
  /// Creates a [TextTileStyle] tween.
  ///
  /// the [begin] and [end] properties may be null; see [WxTileStyle.lerp] for
  /// the null handling semantics.
  WxTileStyleTween({super.begin, super.end});

  /// Returns the value this tween has at the given animation clock value.
  @override
  WxTileStyle? lerp(double t) {
    return WxTileStyle.lerp(begin, end, t);
  }
}

/// An interpolation between two [WxTileThemeData]s.
///
/// This class specializes the interpolation of [Tween] to use [WxTileThemeData.lerp].
class WxTileThemeDataTween extends Tween<WxTileThemeData?> {
  /// Creates a [WxTileThemeData] tween.
  ///
  /// the [begin] and [end] properties may be null; see [WxTileThemeData.lerp] for
  /// the null handling semantics.
  WxTileThemeDataTween({super.begin, super.end});

  /// Returns the value this tween has at the given animation clock value.
  @override
  WxTileThemeData? lerp(double t) {
    return begin?.lerp(end, t) ?? end;
  }
}
