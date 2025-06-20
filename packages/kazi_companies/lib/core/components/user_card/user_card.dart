import 'package:flutter/material.dart';
import 'package:kazi_companies/core/components/badge_label.dart';
import 'package:kazi_companies/core/components/user_card/components/client_card_details.dart';
import 'package:kazi_companies/core/components/user_card/components/employee_card_details.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_core/kazi_core.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, this.clientInfo});
  final User user;
  final ClientInfo? clientInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(KaziInsets.xLg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: KaziInsets.sm,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: user.photoUrl != null
                          ? NetworkImage(user.photoUrl!)
                          : null,
                      child: user.photoUrl == null
                          ? const Icon(Icons.person, size: 32)
                          : null,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: KaziTextStyles.titleMd
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (user.role != null)
                          Text(
                            user.role!,
                            style: KaziTextStyles.titleSm,
                            overflow: TextOverflow.ellipsis,
                          ),
                        Text(
                          user.phones.isNotEmpty ? user.phones.first : '',
                          style: KaziTextStyles.md,
                        ),
                        Text(
                          user.email,
                          style: KaziTextStyles.md,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                if (user.isBirthdayInMonth)
                  const BadgeLabel(
                    text: 'Aniversário',
                    icon: Icons.cake,
                    color: KaziColors.orange,
                  ),
              ],
            ),
            KaziSpacings.verticalMd,
            if (clientInfo != null)
              ClientCardDetails(clientInfo: clientInfo!)
            else
              EmployeeCardDetails(user: user),
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
                  onTap: () => onTapButton(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onTapButton(BuildContext context) {
    if (clientInfo != null) {
      return context.navigate(
        '${Routes.clients}/${user.id}',
        params: clientInfo,
      );
    }

    context.navigate('${Routes.employees}/${user.id}', params: user);
  }
}
