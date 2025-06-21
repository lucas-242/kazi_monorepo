import 'package:kazi_core/modules/users/data/api_users_repository.dart';
import 'package:kazi_core/modules/users/domain/repositories/users_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kazi_providers.g.dart';

@riverpod
UsersRepository usersRepository(Ref ref) => ApiUsersRepository();
