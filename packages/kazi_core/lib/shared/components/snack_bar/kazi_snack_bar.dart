import 'package:flutter/material.dart';
import 'package:kazi_core/shared/components/snack_bar/kazi_snack_bar_type.dart';
import 'package:kazi_core/shared/themes/themes.dart';

void showKaziSnackBar(
  BuildContext context,
  String message, {
  bool hasBottomNavigation = true,
  bool horizontalMargin = true,
  SnackBarType type = SnackBarType.error,
}) {
  final finalHorizontalBorder = horizontalMargin ? KaziInsets.lg : 0.0;
  final backgroundColor =
      type == SnackBarType.error ? KaziColors.red : KaziColors.green;

  final OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: (hasBottomNavigation ? KaziSizings.bottomAppBarHeight : 0) +
          KaziInsets.xs,
      left: finalHorizontalBorder,
      right: finalHorizontalBorder,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(KaziInsets.md),
          child: Text(
            message,
            style: KaziTextStyles.titleSm.copyWith(color: KaziColors.white),
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(const Duration(seconds: 5)).then((value) {
    overlayEntry.remove();
  });
}
