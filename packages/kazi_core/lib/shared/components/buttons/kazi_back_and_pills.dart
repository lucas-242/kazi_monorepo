import 'package:flutter/material.dart';
import 'package:kazi_core/shared/components/buttons/kazi_circular_button.dart';
import 'package:kazi_core/shared/themes/themes.dart';

class KaziBackAndPills extends StatelessWidget {
  const KaziBackAndPills({
    super.key,
    this.onTapPill1,
    this.text,
    this.onTapBack,
    this.pills,
  });
  final VoidCallback? onTapBack;
  final VoidCallback? onTapPill1;
  final String? text;
  final List<Widget>? pills;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            KaziCircularButton(
              onTap: onTapBack,
              child: const Icon(Icons.chevron_left),
            ),
            KaziSpacings.horizontalSm,
            Visibility(
              visible: text != null,
              child: Text(
                text ?? '',
                style: KaziTextStyles.titleMd,
              ),
            ),
          ],
        ),
        if (pills != null) Row(children: pills!),
      ],
    );
  }
}
