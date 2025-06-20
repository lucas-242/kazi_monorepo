import 'package:flutter/material.dart';
import 'package:kazi_companies/core/components/badge_label.dart';
import 'package:kazi_companies/core/components/most_used_services.dart';
import 'package:kazi_core/kazi_core.dart';

class ClientCardDetails extends StatelessWidget {
  const ClientCardDetails({super.key, required this.clientInfo});
  final ClientInfo clientInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(KaziInsets.md),
          decoration: BoxDecoration(
            color: KaziColors.background,
            borderRadius: BorderRadius.circular(KaziInsets.xs),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Último Serviço', style: KaziTextStyles.md),
                  KaziSpacings.verticalXs,
                  Text(
                    clientInfo.lastServiceName,
                    style:
                        KaziTextStyles.md.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    clientInfo.lastServiceDateFormatted,
                    style: KaziTextStyles.md,
                  ),
                ],
              ),
              BadgeLabel(
                text: clientInfo.isLastServiceLate
                    ? '+${clientInfo.daysSinceLastService} dias'
                    : 'Recente',
                icon:
                    clientInfo.isLastServiceLate ? Icons.schedule : Icons.check,
                color: clientInfo.isLastServiceLate
                    ? KaziColors.red
                    : KaziColors.green,
              ),
            ],
          ),
        ),
        KaziSpacings.verticalSm,
        Text('Serviços Mais Realizados', style: KaziTextStyles.md),
        KaziSpacings.verticalSm,
        MostUsedServices(items: clientInfo.mostUsedServices),
      ],
    );
  }
}
