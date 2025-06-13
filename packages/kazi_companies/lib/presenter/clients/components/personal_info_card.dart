import 'package:flutter/material.dart';
import 'package:kazi_companies/core/components/badge_label.dart';
import 'package:kazi_companies/presenter/clients/components/personal_info_row.dart';
import 'package:kazi_companies/presenter/clients/models/client_info.dart';
import 'package:kazi_core/kazi_core.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({super.key, required this.clientInfo});
  final ClientInfo clientInfo;

  @override
  Widget build(BuildContext context) {
    final user = clientInfo.user;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(KaziInsets.xLg),
        child: Row(
          spacing: KaziInsets.md,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage:
                  user.photoUrl != null ? NetworkImage(user.photoUrl!) : null,
              child: user.photoUrl == null
                  ? const Icon(Icons.person, size: 55)
                  : null,
            ),
            Expanded(
              child: Column(
                spacing: KaziInsets.lg,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: KaziTextStyles.headlineLg,
                          ),
                          Text('Cliente desde ${user.admissionDate?.format()}'),
                        ],
                      ),
                      if (clientInfo.user.isBirthdayInMonth)
                        const BadgeLabel(
                          text: 'Aniversário este mês!',
                          icon: Icons.cake,
                          color: KaziColors.orange,
                        ),
                    ],
                  ),
                  Row(
                    spacing: context.width * 0.1,
                    children: [
                      Column(
                        spacing: KaziInsets.lg,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PersonalInfoRow(
                            icon: Icons.mail,
                            color: KaziColors.blue,
                            label: KaziLocalizations.current.email,
                            text: user.email,
                          ),
                          PersonalInfoRow(
                            icon: Icons.phone,
                            color: KaziColors.green,
                            label: KaziLocalizations.current.phone,
                            text: user.phones.first,
                          ),
                        ],
                      ),
                      Column(
                        spacing: KaziInsets.lg,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PersonalInfoRow(
                            icon: Icons.cake,
                            color: KaziColors.pink,
                            label: 'Data de Nascimento',
                            text: user.birthDate.format(),
                          ),
                          PersonalInfoRow(
                            icon: Icons.place,
                            color: KaziColors.purple,
                            label: KaziLocalizations.current.address,
                            text:
                                user.addresses.firstOrNull?.normalizedAddress ??
                                    '',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
