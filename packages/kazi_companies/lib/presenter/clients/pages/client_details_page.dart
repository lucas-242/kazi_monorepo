import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazi_companies/presenter/clients/components/most_used_services.dart';
import 'package:kazi_companies/presenter/clients/components/personal_info_card.dart';
import 'package:kazi_companies/presenter/clients/components/services_history.dart';
import 'package:kazi_companies/presenter/clients/cubit/client_details_cubit.dart';
import 'package:kazi_companies/presenter/clients/models/client_info.dart';
import 'package:kazi_core/kazi_core.dart';

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
                padding: const EdgeInsets.only(top: KaziInsets.xxLg),
                child: BlocBuilder<ClientDetailsCubit, ClientDetailsState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PersonalInfoCard(clientInfo: state.clientInfo),
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
