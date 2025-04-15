import 'package:flutter/material.dart';
import 'package:kazi_core/shared/themes/themes.dart';

import 'kazi_pill_button.dart';

class KaziTitleAndPill extends StatelessWidget {
  const KaziTitleAndPill({
    super.key,
    required this.title,
    required this.onTap,
    required this.pillText,
  });
  final VoidCallback onTap;
  final String title;
  final String pillText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: KaziTextStyles.titleMd),
        KaziPillButton(
          onTap: onTap,
          child: Text(pillText),
        ),
      ],
    );
  }
}
