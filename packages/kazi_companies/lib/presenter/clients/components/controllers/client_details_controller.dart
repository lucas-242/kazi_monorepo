import 'package:kazi_companies/presenter/clients/components/controllers/client_details_state.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_core/modules/users/data/api_users_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_details_controller.g.dart';

@riverpod
class ClientDetailsController extends _$ClientDetailsController {
  UsersRepository get _repository => usersRepository(ref);

  @override
  ClientDetailsState build() =>
      ClientDetailsInitial(clientInfo: ClientInfo.empty());

  Future<void> init(String? clientId, ClientInfo? clientInfo) async {
    if (clientInfo == null && clientId == clientId) {
      state = ClientDetailsError(clientInfo: state.clientInfo);
      return;
    }

    if (clientInfo != null) {
      state = ClientDetailsInitial(clientInfo: clientInfo);
      return;
    }

    final id = int.tryParse(clientId!);
    if (id == null) {
      state = ClientDetailsError(clientInfo: state.clientInfo);
      return;
    }

    final user = await _repository.getClientInfoById(id);
    if (user == null) {
      state = ClientDetailsError(clientInfo: state.clientInfo);
      return;
    }

    state = ClientDetailsInitial(clientInfo: user);
  }
}
