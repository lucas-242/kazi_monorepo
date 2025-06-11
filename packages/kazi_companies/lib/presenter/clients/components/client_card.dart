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
        padding: const EdgeInsets.all(KaziInsets.md),
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
                      style: KaziTextStyles.lg
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      client.user.phones.isNotEmpty
                          ? client.user.phones.first
                          : '',
                      style: KaziTextStyles.sm,
                    ),
                    Text(client.user.email, style: KaziTextStyles.sm),
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
              padding: const EdgeInsets.all(KaziInsets.xs),
              decoration: BoxDecoration(
                color: KaziColors.lightestGrey,
                borderRadius: BorderRadius.circular(KaziInsets.xs),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Último Serviço', style: KaziTextStyles.sm),
                      Text(
                        client.lastServiceName,
                        style: KaziTextStyles.md
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        client.lastServiceDateFormatted,
                        style: KaziTextStyles.sm,
                      ),
                    ],
                  ),
                  BadgeLabel(
                    text: client.isLastServiceLate
                        ? '+${client.daysSinceLastService} dias'
                        : 'Recente',
                    icon: client.isLastServiceLate
                        ? Icons.error
                        : Icons.check_circle,
                    color: client.isLastServiceLate
                        ? KaziColors.red
                        : KaziColors.green,
                  ),
                ],
              ),
            ),
            KaziSpacings.verticalSm,
            Text('Serviços Mais Realizados', style: KaziTextStyles.titleMd),
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
