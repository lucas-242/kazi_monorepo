import 'package:kazi_companies/presenter/employees/controllers/employees_state.dart';
import 'package:kazi_core/modules/users/data/api_users_repository.dart';
import 'package:kazi_core/modules/users/domain/models/get_users_params.dart';
import 'package:kazi_core/modules/users/domain/repositories/users_repository.dart';
import 'package:kazi_core/shared/entities/user.dart';
import 'package:kazi_core/shared/enums/user_type.dart';
import 'package:kazi_core/shared/models/errors.dart';
import 'package:kazi_core/shared/utils/log_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employees_controller.g.dart';

@riverpod
class EmployeesController extends _$EmployeesController {
  UsersRepository get _repository => ref.read(usersRepositoryProvider);

  @override
  EmployeesState build() => const EmployeesInitial(employees: []);

  Future<void> onInit({bool fromCache = true}) async {
    try {
      state = EmployeesLoading(employees: state.employees);
      final employees = await _getEmployees(fromCache);
      state = EmployeesInitial(employees: employees);
    } on AppError catch (error) {
      //TODO handle error
    }
  }

  Future<List<User>> _getEmployees([bool fromCache = true]) async {
    if (!fromCache || state.employees.isEmpty) {
      return _repository.get(GetUsersParams(userType: UserType.employee));
    }

    Log.info('Getting users from cache');
    return state.employees;
  }
}
