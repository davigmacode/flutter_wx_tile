import 'package:flutter/animation.dart';
import 'style.dart';
import 'theme_data.dart';

/// An interpolation between two [WxTextTileStyle]s.
///
/// This class specializes the interpolation of [Tween] to use [WxTextTileStyle.lerp].
class WxTextTileStyleTween extends Tween<WxTextTileStyle?> {
  /// Creates a [WxTextTileStyle] tween.
  ///
  /// the [begin] and [end] properties may be null; see [WxTextTileStyle.lerp] for
  /// the null handling semantics.
  WxTextTileStyleTween({super.begin, super.end});

  /// Returns the value this tween has at the given animation clock value.
  @override
  WxTextTileStyle? lerp(double t) {
    return WxTextTileStyle.lerp(begin, end, t);
  }
}

/// An interpolation between two [WxTextTileThemeData]s.
///
/// This class specializes the interpolation of [Tween] to use [WxTextTileThemeData.lerp].
class WxTextTileThemeDataTween extends Tween<WxTextTileThemeData?> {
  /// Creates a [TileThemeData] tween.
  ///
  /// the [begin] and [end] properties may be null; see [TileThemeData.lerp] for
  /// the null handling semantics.
  WxTextTileThemeDataTween({super.begin, super.end});

  /// Returns the value this tween has at the given animation clock value.
  @override
  WxTextTileThemeData? lerp(double t) {
    return begin?.lerp(end, t) ?? end;
  }
}
