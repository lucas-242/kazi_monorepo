import 'package:kazi_core/modules/users/domain/models/create_user_params.dart';
import 'package:kazi_core/modules/users/domain/models/get_users_params.dart';
import 'package:kazi_core/modules/users/domain/models/update_user_params.dart';
import 'package:kazi_core/shared/entities/user.dart';

abstract interface class UsersRepository {
  Future<void> create(CreateUserParams params);

  Future<void> delete(int userId);

  Future<List<User>> get(GetUsersParams params);

  Future<User?> getById(int userId);

  Future<void> update(UpdateUserParams params);
}
