import 'package:kazi_core/modules/users/domain/repositories/users_repository.dart';
import 'package:kazi_core/shared/entities/user.dart';
import 'package:kazi_core/shared/models/errors.dart';
import 'package:kazi_core/shared/utils/log_utils.dart';

class GetUserUseCase {
  GetUserUseCase(this._usersRepository);

  final UsersRepository _usersRepository;

  Future<User?> call(int userId) async {
    try {
      final response = _usersRepository.getById(userId);
      return response;
    } on AppError catch (error) {
      Log.error(error);
      rethrow;
    }
  }
}
