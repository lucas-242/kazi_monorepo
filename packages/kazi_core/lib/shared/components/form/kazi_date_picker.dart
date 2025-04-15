import 'package:flutter/material.dart';
import 'package:kazi_core/shared/components/form/kazi_text_form_field.dart';

class KaziDatePicker extends StatelessWidget {
  KaziDatePicker({
    super.key,
    required this.controller,
    required this.onChange,
    DateTime? initialDate,
    required this.label,
    this.validator,
    required this.firstDate,
    required this.lastDate,
  }) : initialDate = initialDate ?? DateTime.now();
  final TextEditingController controller;
  final void Function(DateTime) onChange;
  final String label;
  final String? Function(String?)? validator;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  Widget build(BuildContext context) {
    void onChangeDatePicker(DateTime? date) {
      if (date != null) {
        onChange(date);
      }
    }

    return KaziTextFormField(
      labelText: label,
      keyboardType: TextInputType.datetime,
      controller: controller,
      readOnly: true,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate:
              controller.text.isNotEmpty ? initialDate : DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
        ).then((value) => onChangeDatePicker(value));
      },
      validator: validator,
    );
  }
}
