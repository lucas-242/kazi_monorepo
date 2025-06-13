import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazi_companies/presenter/clients/components/header_details.dart';
import 'package:kazi_companies/presenter/clients/cubit/client_details_cubit.dart';
import 'package:kazi_core/kazi_core.dart';

import '../components/badge_label.dart';
import '../components/most_used_services.dart';
import '../models/client_info.dart';

class ClientDetailsPage extends StatefulWidget {
  const ClientDetailsPage({super.key, this.client, this.clientId});
  final String? clientId;
  final ClientInfo? client;

  @override
  State<ClientDetailsPage> createState() => _ClientDetailsPageState();
}

class _ClientDetailsPageState extends State<ClientDetailsPage> {
  late final ClientDetailsCubit _cubit;
  @override
  void initState() {
    _cubit = ClientDetailsCubit();
    _cubit.init(widget.clientId, widget.client);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Builder(
        builder: (context) {
          return KaziSafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(KaziInsets.xLg),
                child: BlocBuilder<ClientDetailsCubit, ClientDetailsState>(
                  builder: (context, state) {
                    final user = state.clientInfo.user;
                    final address =
                        user.addresses.isNotEmpty ? user.addresses.first : null;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderDetails(clientInfo: state.clientInfo),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: user.photoUrl != null
                                  ? NetworkImage(user.photoUrl!)
                                  : null,
                              child: user.photoUrl == null
                                  ? const Icon(Icons.person, size: 36)
                                  : null,
                            ),
                            const SizedBox(width: KaziInsets.lg),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name,
                                    style: KaziTextStyles.titleMd
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Cliente desde Janeiro 2023',
                                    style: KaziTextStyles.md,
                                  ),
                                  const SizedBox(height: KaziInsets.sm),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.email,
                                        size: 18,
                                        color: KaziColors.primary,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        user.email,
                                        style: KaziTextStyles.md,
                                      ),
                                    ],
                                  ),
                                  if (user.phones.isNotEmpty) ...[
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.phone,
                                          size: 18,
                                          color: KaziColors.green,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          user.phones.first,
                                          style: KaziTextStyles.md,
                                        ),
                                      ],
                                    ),
                                  ],
                                  if (user.phones.length > 1) ...[
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.chat,
                                          size: 18,
                                          color: KaziColors.green,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          user.phones[1],
                                          style: KaziTextStyles.md,
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            if (state.clientInfo.isBirthday)
                              const BadgeLabel(
                                text: 'Aniversário esta semana!',
                                icon: Icons.cake,
                                color: KaziColors.orange,
                              ),
                          ],
                        ),
                        const SizedBox(height: KaziInsets.lg),
                        Row(
                          children: [
                            const Icon(
                              Icons.cake,
                              size: 18,
                              color: KaziColors.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Data de Nascimento: ',
                              style: KaziTextStyles.md,
                            ),
                            Text(
                              '${user.birthDate.day.toString().padLeft(2, '0')}/${user.birthDate.month.toString().padLeft(2, '0')}/${user.birthDate.year}',
                              style: KaziTextStyles.md
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        if (address != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 18,
                                color: KaziColors.primary,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  '${address.street}, ${address.number ?? ''}\n${address.city}, ${address.state} - CEP: ${address.postalCode}',
                                  style: KaziTextStyles.md,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: KaziInsets.xLg),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Histórico de Serviços',
                              style: KaziTextStyles.titleSm
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            if (state.clientInfo.isLastServiceLate)
                              const BadgeLabel(
                                text: 'Último serviço há mais de 20 dias',
                                icon: Icons.warning,
                                color: KaziColors.red,
                              ),
                          ],
                        ),
                        const SizedBox(height: KaziInsets.md),
                        ...state.clientInfo.serviceHistory.take(5).map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: KaziInsets.sm,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.check_circle_outline,
                                          color: KaziColors.primary,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.serviceName,
                                              style: KaziTextStyles.md.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Por ${item.professionalName}',
                                              style: KaziTextStyles.sm,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      item.formattedDate,
                                      style: KaziTextStyles.sm,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        if (state.clientInfo.serviceHistory.length > 5)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Ver histórico completo →'),
                            ),
                          ),
                        const SizedBox(height: KaziInsets.xLg),
                        Text(
                          'Serviços Mais Realizados',
                          style: KaziTextStyles.titleSm
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: KaziInsets.md),
                        MostUsedServices(
                          items: state.clientInfo.mostUsedServices,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
