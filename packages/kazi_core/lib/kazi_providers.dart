import 'package:kazi_core/modules/services/data/api_service_type_repository.dart';
import 'package:kazi_core/modules/services/domain/repositories/service_type_repository.dart';
import 'package:kazi_core/modules/users/data/api_user_repository.dart';
import 'package:kazi_core/modules/users/domain/repositories/user_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kazi_providers.g.dart';

@riverpod
UserRepository usersRepository(Ref ref) => ApiUserRepository();

@riverpod
ServiceTypeRepository serviceTypeRepositoy(Ref ref) =>
    ApiServiceTypeRepository();
