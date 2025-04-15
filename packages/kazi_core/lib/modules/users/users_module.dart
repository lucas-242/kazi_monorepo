import 'package:kazi_core/modules/users/application/use_cases/create_user_use_case.dart';
import 'package:kazi_core/modules/users/application/use_cases/delete_user_use_case.dart';
import 'package:kazi_core/modules/users/application/use_cases/get_user_use_case.dart';
import 'package:kazi_core/modules/users/application/use_cases/get_users_use_case.dart';
import 'package:kazi_core/modules/users/application/use_cases/update_user_use_case.dart';
import 'package:kazi_core/modules/users/data/api_users_repository.dart';
import 'package:kazi_core/modules/users/domain/repositories/users_repository.dart';
import 'package:kazi_core/shared/injection/service_injector.dart';
import 'package:kazi_core/shared/injection/service_locator.dart';

abstract class UsersModule {
  static void init() {
    ServiceInjector.factory<UsersRepository>(ApiUsersRepository.new);

    ServiceInjector.factory(
      () => CreateUserUseCase(ServiceLocator.get<UsersRepository>()),
    );
    ServiceInjector.factory(
      () => DeleteUserUseCase(ServiceLocator.get<UsersRepository>()),
    );
    ServiceInjector.factory(
      () => GetUserUseCase(ServiceLocator.get<UsersRepository>()),
    );
    ServiceInjector.factory(
      () => GetUsersUseCase(ServiceLocator.get<UsersRepository>()),
    );
    ServiceInjector.factory(
      () => UpdateUserUseCase(ServiceLocator.get<UsersRepository>()),
    );
  }
}
