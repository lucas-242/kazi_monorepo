import 'package:kazi_companies/presenter/employees/controllers/employee_details_state.dart';
import 'package:kazi_core/modules/users/data/api_users_repository.dart';
import 'package:kazi_core/modules/users/domain/repositories/users_repository.dart';
import 'package:kazi_core/shared/entities/user.dart';
import 'package:kazi_core/shared/models/errors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_details_controller.g.dart';

@riverpod
class EmployeeDetailsController extends _$EmployeeDetailsController {
  @override
  EmployeeDetailsState build() =>
      EmployeeDetailsInitial(employee: User.empty());

  UsersRepository get _repository => ref.read(usersRepositoryProvider);

  Future<void> onInit({
    User? employee,
    int? employeeId,
  }) async {
    try {
      if (employee != null) {
        state = EmployeeDetailsInitial(employee: employee);
        return;
      }

      state = EmployeeDetailsLoading(employee: state.employee);

      if (employeeId == null) {
        //TODO handle error
        return;
      }

      final response = await _repository.getById(employeeId);
      state = EmployeeDetailsInitial(employee: response);
    } on AppError catch (error) {
      //TODO handle error
    }
  }
}
