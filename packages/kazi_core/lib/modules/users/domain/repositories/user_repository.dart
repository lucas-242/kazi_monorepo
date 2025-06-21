import 'package:kazi_core/kazi_core.dart';

abstract interface class UserRepository {
  Future<void> create(CreateUserParams params);

  Future<void> delete(int userId);

  Future<List<User>> get(GetUsersParams params);

  Future<User?> getById(int userId);

  Future<ClientInfo?> getClientInfoById(int userId);

  Future<List<ClientInfo>> getClientsInfo();

  Future<void> update(UpdateUserParams params);
}
