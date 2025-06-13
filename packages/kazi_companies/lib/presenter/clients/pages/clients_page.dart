import 'package:flutter/material.dart';
import 'package:kazi_companies/core/components/user_card/user_card.dart';
import 'package:kazi_companies/presenter/clients/mock/mock_clients.dart';
import 'package:kazi_companies/presenter/clients/models/client_info.dart';
import 'package:kazi_core/kazi_core.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final List<ClientInfo> clients = mockClients;

  @override
  Widget build(BuildContext context) {
    return KaziSafeArea(
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
    );
  }
}
