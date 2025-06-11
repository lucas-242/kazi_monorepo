import 'package:flutter/material.dart';
import 'package:kazi_companies/presenter/clients/components/badge_label.dart';
import 'package:kazi_companies/presenter/clients/components/most_used_services.dart';
import 'package:kazi_companies/presenter/clients/models/client_info.dart';
import 'package:kazi_core/kazi_core.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({super.key, required this.client});
  final ClientInfo client;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(KaziInsets.xLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      client.user.name,
                      style: KaziTextStyles.titleMd
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      client.user.phones.isNotEmpty
                          ? client.user.phones.first
                          : '',
                      style: KaziTextStyles.md,
                    ),
                    Text(client.user.email, style: KaziTextStyles.md),
                  ],
                ),
                if (client.isBirthday)
                  const BadgeLabel(
                    text: 'Aniversário',
                    icon: Icons.cake,
                    color: KaziColors.orange,
                  ),
              ],
            ),
            KaziSpacings.verticalSm,
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
                        client.lastServiceName,
                        style: KaziTextStyles.md
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        client.lastServiceDateFormatted,
                        style: KaziTextStyles.md,
                      ),
                    ],
                  ),
                  BadgeLabel(
                    text: client.isLastServiceLate
                        ? '+${client.daysSinceLastService} dias'
                        : 'Recente',
                    icon:
                        client.isLastServiceLate ? Icons.schedule : Icons.check,
                    color: client.isLastServiceLate
                        ? KaziColors.red
                        : KaziColors.green,
                  ),
                ],
              ),
            ),
            KaziSpacings.verticalSm,
            Text('Serviços Mais Realizados', style: KaziTextStyles.md),
            KaziSpacings.verticalSm,
            MostUsedServices(items: client.mostUsedServices),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: KaziElevatedButton.icon(
                    onTap: () {},
                    icon: const Icon(Icons.calendar_month_sharp),
                    label: 'Agendar',
                  ),
                ),
                KaziSpacings.horizontalMd,
                KaziElevatedButton.icon(
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  backgroundColor: KaziColors.lightGrey,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
