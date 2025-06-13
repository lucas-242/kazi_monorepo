import 'package:flutter/material.dart';
import 'package:kazi_companies/core/components/badge_label.dart';
import 'package:kazi_core/kazi_core.dart';

class EmployeeCardDetails extends StatelessWidget {
  const EmployeeCardDetails({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Serviços', style: KaziTextStyles.headlineSm),
        KaziSpacings.verticalSm,
        Wrap(
          spacing: KaziInsets.xxs,
          runSpacing: KaziInsets.xxs,
          children: user.services
              .map(
                (s) => BadgeLabel(text: s.name, color: s.colorAs),
              )
              .toList(),
        ),
      ],
    );
  }
}
