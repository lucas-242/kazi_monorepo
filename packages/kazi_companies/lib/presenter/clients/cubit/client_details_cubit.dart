import 'package:bloc/bloc.dart';
import 'package:kazi_companies/presenter/clients/mock/mock_clients.dart';
import 'package:kazi_companies/presenter/clients/models/client_info.dart';

part 'client_details_state.dart';

class ClientDetailsCubit extends Cubit<ClientDetailsState> {
  ClientDetailsCubit()
      : super(ClientDetailsInitial(clientInfo: ClientInfo.empty()));

  void init(String? clientId, ClientInfo? clientInfo) {
    return emit(ClientDetailsInitial(clientInfo: mockClients.elementAt(3)));

    if (clientInfo == null && clientId == clientId) {
      return emit(ClientDetailsError(clientInfo: state.clientInfo));
    }

    if (clientInfo != null) {
      return emit(ClientDetailsInitial(clientInfo: clientInfo));
    }

    final id = int.tryParse(clientId!);
    if (id != null) {
      return emit(ClientDetailsError(clientInfo: state.clientInfo));
    }

    //TODO: get client by Id
    final response = mockClients.firstWhere(
      (element) => element.user.id == id,
      orElse: ClientInfo.empty,
    );

    if (response.user.id == 0) {
      return emit(ClientDetailsError(clientInfo: state.clientInfo));
    }

    emit(ClientDetailsInitial(clientInfo: response));
  }
}
