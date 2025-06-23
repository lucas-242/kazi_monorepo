import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_core/modules/users/data/mocks/client_info_mock.dart';
import 'package:kazi_core/modules/users/data/mocks/user_mock.dart';
import 'package:kazi_core/modules/users/domain/models/create_client_params.dart';

final class ApiUserRepository implements UserRepository {
  @override
  Future<void> create(CreateUserParams params) async {
    try {
      await Future.delayed(const Duration(seconds: 4));
    } catch (error, trace) {
      throw ExternalError(
        'Error to create user with identifier: ${params.identifier}',
        trace: trace,
      );
    }
  }

  @override
  Future<void> createClient(CreateClientParams params) async {
    try {
      await Future.delayed(const Duration(seconds: 4));
    } catch (error, trace) {
      throw ExternalError(
        'Error to create client with identifier: ${params.identifier}',
        trace: trace,
      );
    }
  }

  @override
  Future<void> delete(int userId) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
    } catch (error, trace) {
      throw ExternalError(
        'Error to create user with id: $userId',
        trace: trace,
      );
    }
  }

  @override
  Future<List<User>> get(GetUsersParams params) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      Iterable<User> response = <User>[];

      if (params.userType != null) {
        response =
            UserMock.all.where((user) => user.userType == params.userType);
      }

      if (params.name != null) {
        response = UserMock.all.where((user) => user.name == params.name);
      }

      return response.toList();
    } catch (error, trace) {
      throw ExternalError(
        'Error to get user with filters: $params',
        trace: trace,
      );
    }
  }

  @override
  Future<User?> getById(int userId) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return UserMock.all.firstWhere((user) => user.id == userId);
    } catch (error, trace) {
      throw ExternalError('Error to get user with id: $userId', trace: trace);
    }
  }

  @override
  Future<ClientInfo?> getClientInfoById(int userId) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return ClientInfoMock.mock.firstWhere((m) => m.user.id == userId);
    } catch (error, trace) {
      throw ExternalError('Error to get user with id: $userId', trace: trace);
    }
  }

  @override
  Future<List<ClientInfo>> getClientsInfo() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return ClientInfoMock.mock;
    } catch (error, trace) {
      throw ExternalError('Error to get users', trace: trace);
    }
  }

  @override
  Future<void> update(UpdateUserParams params) async {
    try {
      await Future.delayed(const Duration(seconds: 4));
    } catch (error, trace) {
      throw ExternalError(
        'Error to update user with params: $params',
        trace: trace,
      );
    }
  }
}
