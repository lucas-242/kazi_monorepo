import 'package:kazi_core/modules/users/data/api_users_repository.dart';
import 'package:kazi_core/modules/users/domain/models/get_users_params.dart';
import 'package:kazi_core/modules/users/domain/repositories/users_repository.dart';
import 'package:kazi_core/shared/entities/user.dart';
import 'package:kazi_core/shared/enums/user_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employees_controller.g.dart';

@riverpod
class EmployeesController extends _$EmployeesController {
  UsersRepository get repository => ref.read(usersRepositoryProvider);

  @override
  FutureOr<EmployeesInitialState> build() async {
    final response =
        await repository.get(GetUsersParams(userType: UserType.employee));
    return EmployeesInitialState(employees: response);
  }
}

final class EmployeesInitialState {
  const EmployeesInitialState({required this.employees});

  final List<User> employees;
}
