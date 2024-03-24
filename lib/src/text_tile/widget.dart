import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../tile/widget.dart';
import 'style.dart';
import 'types.dart';
import 'theme.dart';

class WxTextTile extends StatelessWidget {
  const WxTextTile({
    Key? key,
    this.spacing,
    this.margin,
    this.align,
    this.style,
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
  }) : super(key: key);

  /// {@macro WxTextTile.spacing}
  final double? spacing;

  /// {@macro WxTextTile.margin}
  final EdgeInsetsGeometry? margin;

  /// {@macro WxTextTile.align}
  final WxTextTileAlign? align;

  /// The style to be applied
  final WxTextTileStyle? style;

  /// The primary content
  final Widget title;

  /// {@macro WxTextTile.titleStyle}
  final TextStyle? titleStyle;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// {@macro WxTextTile.subtitleStyle}
  final TextStyle? subtitleStyle;

  WxTextTileStyle get effectiveStyle {
    return WxTextTileStyle.from(style).copyWith(
      spacing: spacing,
      margin: margin,
      align: align,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final defaultTitleStyle = textTheme.bodyLarge?.copyWith(
      color: colorScheme.onSurface,
    );
    final defaultSubtitleStyle = textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
    );

    final tileTheme = WxTextTileTheme.of(context);
    final themedStyle = tileTheme.style.merge(effectiveStyle);
    return WxTile(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      inline: false,
      spacingEnforced: false,
      spacing: themedStyle.spacing,
      margin: themedStyle.margin,
      crossAxisAlignment: themedStyle.crossAxisAlignment,
      trailing: subtitle != null
          ? DefaultTextStyle.merge(
              style: subtitleStyle ?? defaultSubtitleStyle,
              child: subtitle!,
            )
          : null,
      child: DefaultTextStyle.merge(
        style: titleStyle ?? defaultTitleStyle,
        child: title,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    effectiveStyle.debugFillProperties(properties);
  }
}
