import 'package:kazi_core/modules/users/domain/repositories/users_repository.dart';
import 'package:kazi_core/shared/models/errors.dart';
import 'package:kazi_core/shared/utils/log_utils.dart';

class DeleteUserUseCase {
  DeleteUserUseCase(this._usersRepository);

  final UsersRepository _usersRepository;

  Future<void> call(int userId) async {
    try {
      final response = _usersRepository.delete(userId);
      return response;
    } on AppError catch (error) {
      Log.error(error);
      rethrow;
    }
  }
}
