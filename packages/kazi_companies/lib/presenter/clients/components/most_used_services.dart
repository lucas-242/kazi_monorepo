import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/clients/components/badge_label.dart';
import 'package:kazi_core/kazi_core.dart';

class MostUsedServices extends StatelessWidget {
  const MostUsedServices({super.key, required this.items});

  final Map<String, int> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: items.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(items.keys.elementAt(index)),
            BadgeLabel(
              text: items.values.elementAt(index).toString(),
              color: KaziColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
