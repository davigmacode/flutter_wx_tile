import 'package:flutter/animation.dart';
import 'style.dart';
import 'theme_data.dart';

/// An interpolation between two [WxListTileStyle]s.
///
/// This class specializes the interpolation of [Tween] to use [WxListTileStyle.lerp].
class WxListTileStyleTween extends Tween<WxListTileStyle?> {
  /// Creates a [WxListTileStyle] tween.
  ///
  /// the [begin] and [end] properties may be null; see [WxListTileStyle.lerp] for
  /// the null handling semantics.
  WxListTileStyleTween({super.begin, super.end});

  /// Returns the value this tween has at the given animation clock value.
  @override
  WxListTileStyle? lerp(double t) {
    return WxListTileStyle.lerp(begin, end, t);
  }
}

/// An interpolation between two [WxListTileThemeData]s.
///
/// This class specializes the interpolation of [Tween] to use [WxListTileThemeData.lerp].
class WxListTileThemeDataTween extends Tween<WxListTileThemeData?> {
  /// Creates a [TileThemeData] tween.
  ///
  /// the [begin] and [end] properties may be null; see [TileThemeData.lerp] for
  /// the null handling semantics.
  WxListTileThemeDataTween({super.begin, super.end});

  /// Returns the value this tween has at the given animation clock value.
  @override
  WxListTileThemeData? lerp(double t) {
    return begin?.lerp(end, t) ?? end;
  }
}
