import 'package:kazi_companies/presenter/clients/components/controllers/client_details_state.dart';
import 'package:kazi_companies/presenter/clients/mock/mock_clients.dart';
import 'package:kazi_companies/presenter/clients/models/client_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_details_controller.g.dart';

@riverpod
class ClientDetailsController extends _$ClientDetailsController {
  @override
  ClientDetailsState build() =>
      ClientDetailsInitial(clientInfo: ClientInfo.empty());

  void init(String? clientId, ClientInfo? clientInfo) {
    state = ClientDetailsInitial(
      clientInfo: clientInfo ?? mockClients.elementAt(3),
    );
    return;

    if (clientInfo == null && clientId == clientId) {
      state = ClientDetailsError(clientInfo: state.clientInfo);
      return;
    }

    if (clientInfo != null) {
      state = ClientDetailsInitial(clientInfo: clientInfo);
      return;
    }

    final id = int.tryParse(clientId!);
    if (id != null) {
      state = ClientDetailsError(clientInfo: state.clientInfo);
      return;
    }

    //TODO: get client by Id
    final response = mockClients.firstWhere(
      (element) => element.user.id == id,
      orElse: ClientInfo.empty,
    );

    if (response.user.id == 0) {
      state = ClientDetailsError(clientInfo: state.clientInfo);
      return;
    }

    state = ClientDetailsInitial(clientInfo: response);
  }
}
