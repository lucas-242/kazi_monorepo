import 'package:flutter/material.dart';
import 'package:kazi_core/shared/components/buttons/kazi_pill_button.dart';
import 'package:kazi_core/shared/themes/themes.dart';

class KaziDialog extends StatelessWidget {
  const KaziDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.title,
    required this.message,
    required this.cancelText,
    required this.confirmText,
  });
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final String title;
  final String message;
  final String cancelText;
  final String confirmText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key ?? const Key('KaziDialog'),
      title: Text(title, style: KaziTextStyles.titleMd),
      content: Text(message, style: KaziTextStyles.md),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      actions: [
        KaziPillButton(
          onTap: onCancel,
          child: Text(cancelText),
        ),
        KaziPillButton(
          onTap: onConfirm,
          backgroundColor: context.colorsScheme.error,
          child: Text(confirmText),
        ),
      ],
    );
  }
}
