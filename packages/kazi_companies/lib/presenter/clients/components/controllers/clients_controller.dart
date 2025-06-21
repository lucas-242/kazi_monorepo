import 'package:kazi_core/kazi_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clients_controller.g.dart';

@riverpod
class ClientsController extends _$ClientsController {
  @override
  FutureOr<List<ClientInfo>> build() async {
    final response = await usersRepository(ref).getClientsInfo();
    return response;
  }
}
