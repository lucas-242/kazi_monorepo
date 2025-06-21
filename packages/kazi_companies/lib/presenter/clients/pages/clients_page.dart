import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kazi_companies/core/components/user_card/user_card.dart';
import 'package:kazi_companies/presenter/clients/controllers/clients_controller.dart';
import 'package:kazi_core/kazi_core.dart';

class ClientsPage extends ConsumerWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(clientsControllerProvider);

    return provider.when(
      loading: () => const KaziLoading(),
      error: (error, stackTrace) => KaziError(message: error.toString()),
      data: (clients) => KaziSafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KaziPageTitle(
              title: 'Clientes',
              searchLabel: 'Buscar Clientes...',
              onFilter: () {},
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: KaziInsets.md,
                  mainAxisSpacing: KaziInsets.md,
                  childAspectRatio: 0.9,
                ),
                itemCount: clients.length,
                itemBuilder: (context, index) {
                  final client = clients[index];
                  return UserCard(user: client.user, clientInfo: client);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
