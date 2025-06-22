import 'package:flutter/foundation.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_form_controller.g.dart';

@riverpod
class ClientFormController extends _$ClientFormController {
  @override
  Future<List<ServiceType>> build() {
    return ref.read(serviceTypeRepositoyProvider).get();
  }

  Future<String?> submit({
    required String name,
    required String email,
    required String phone,
    required String identifier,
    String? address,
    String? city,
    String? cep,
    Uint8List? image,
    List<ServiceType>? favoriteServices,
  }) async {
    final params = CreateUserParams(
      name: name,
      email: email,
      identifier: identifier,
      phones: [phone],
      addresses: [], //TODO: Add address logic
      userType: UserType.client,
      role: null,
    );

    try {
      await ref.read(usersRepositoryProvider).create(params);
      return null;
    } catch (error) {
      return error.toString();
    }
  }
}
