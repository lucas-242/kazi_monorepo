import 'package:flutter/material.dart';
import 'package:kazi_core/shared/themes/themes.dart';

class KaziElevatedButton extends StatelessWidget {
  const KaziElevatedButton._({
    super.key,
    required this.onTap,
    this.label,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.labelStyle,
  });

  const KaziElevatedButton.label({
    Key? key,
    required VoidCallback onTap,
    required String label,
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? labelStyle,
    double? width,
    double? height,
  }) : this._(
          key: key,
          onTap: onTap,
          label: label,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          labelStyle: labelStyle,
          width: width,
          height: height,
        );

  const KaziElevatedButton.icon({
    Key? key,
    required VoidCallback onTap,
    String? label,
    required Widget icon,
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? labelStyle,
    double? width,
    double? height,
  }) : this._(
          key: key,
          onTap: onTap,
          label: label,
          icon: icon,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          labelStyle: labelStyle,
          width: width,
          height: height,
        );

  final VoidCallback onTap;
  final String? label;
  final TextStyle? labelStyle;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? KaziColors.primary,
      foregroundColor: foregroundColor ?? KaziColors.darkGrey,
      elevation: 0,
      iconSize: 24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KaziInsets.xs),
      ),
    );

    if (icon != null) {
      if (label != null) {
        return ElevatedButton.icon(
          key: key,
          onPressed: onTap,
          icon: icon!,
          label: Padding(
            padding: const EdgeInsets.symmetric(vertical: KaziInsets.xs),
            child: Text(label!, style: labelStyle ?? KaziTextStyles.titleMd),
          ),
          style: buttonStyle,
        );
      }

      return IconButton(
        key: key,
        onPressed: onTap,
        padding: const EdgeInsets.all(KaziInsets.sm),
        icon: icon!,
        style: buttonStyle,
      );
    }

    return ElevatedButton(
      key: key,
      onPressed: onTap,
      style: buttonStyle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: KaziInsets.xs),
        child: Text(label!, style: labelStyle ?? KaziTextStyles.titleMd),
      ),
    );
  }
}
