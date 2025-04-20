import 'package:kazi_companies/presenter/employees/cubit/employees_cubit.dart';
import 'package:kazi_companies/presenter/services/cubit/services_form_cubit.dart';
import 'package:kazi_core/kazi_core.dart';

abstract class InjectionContainer {
  static void init() {
    UsersModule.init();
    _initBlocs();
  }

  static void _initBlocs() {
    ServiceInjector.factory<ServicesFormCubit>(
      () => ServicesFormCubit(),
    );

    ServiceInjector.factory<EmployeesCubit>(
      () => EmployeesCubit(
        ServiceLocator.get<GetUserUseCase>(),
        ServiceLocator.get<GetUsersUseCase>(),
      ),
    );
  }
}
