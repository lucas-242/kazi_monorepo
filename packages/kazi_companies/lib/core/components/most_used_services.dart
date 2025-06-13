import 'package:flutter/material.dart';
import 'package:kazi_companies/core/components/badge_label.dart';
import 'package:kazi_core/kazi_core.dart';

class MostUsedServices extends StatelessWidget {
  const MostUsedServices({super.key, required this.items});

  final Map<String, int> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: items.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: KaziInsets.xxs),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(items.keys.elementAt(index)),
              BadgeLabel(
                text: '${items.values.elementAt(index)}x',
                color: KaziColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
