import 'package:flutter/material.dart';
import 'package:kazi_core/shared/themes/themes.dart';

class KaziSingleScrollView extends StatelessWidget {
  const KaziSingleScrollView({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...children,
          const SizedBox(height: KaziSizings.bottomAppBarHeight),
        ],
      ),
    );
  }
}
