import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kazi_companies/core/components/most_used_services.dart';
import 'package:kazi_companies/core/components/personal_info_card/personal_info_card.dart';
import 'package:kazi_companies/presenter/clients/components/controllers/client_details_controller.dart';
import 'package:kazi_companies/presenter/clients/components/services_history.dart';
import 'package:kazi_core/kazi_core.dart';

class ClientDetailsPage extends ConsumerWidget {
  const ClientDetailsPage({super.key, this.client, this.clientId});
  final String? clientId;
  final ClientInfo? client;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clientDetailsControllerProvider);

    Future.microtask(() {
      ref.read(clientDetailsControllerProvider.notifier).init(clientId, client);
    });

    return KaziSafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: KaziInsets.xxLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonalInfoCard(user: state.clientInfo.user),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(KaziInsets.xLg),
                  child: Column(
                    spacing: KaziInsets.md,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Serviços Mais Realizados',
                        style: KaziTextStyles.headlineSm,
                      ),
                      MostUsedServices(
                        items: state.clientInfo.mostUsedServices,
                      ),
                    ],
                  ),
                ),
              ),
              ServicesHistory(clientInfo: state.clientInfo),
            ],
          ),
        ),
      ),
    );
  }
}
