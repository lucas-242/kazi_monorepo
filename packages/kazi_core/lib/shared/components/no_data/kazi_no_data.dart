import 'package:flutter/material.dart';
import 'package:kazi_core/shared/components/scroll/kazi_single_scroll_view.dart';
import 'package:kazi_core/shared/themes/themes.dart';

class KaziNoData extends StatelessWidget {
  const KaziNoData({
    super.key,
    required this.message,
    this.navbar,
  });
  final String message;
  final Widget? navbar;

  @override
  Widget build(BuildContext context) {
    return KaziSingleScrollView(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (navbar != null) navbar!,
        if (navbar != null) SizedBox(height: context.height * 0.12),
        Image.asset(KaziImageAssets.noData, package: 'kazi_core'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KaziInsets.lg),
          child: Text(
            message,
            style: KaziTextStyles.headlineSm,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
