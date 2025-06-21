import 'package:kazi_core/kazi_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_form_controller.g.dart';

@riverpod
class ClientFormController extends _$ClientFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<void> submit({
    required String name,
    required String email,
    required String phone,
    required String identifier,
    String? address,
    String? city,
    String? cep,
  }) async {
    state = const AsyncLoading();

    final params = CreateUserParams(
      name: name,
      email: email,
      identifier: identifier,
      phones: [phone],
      addresses: [], //TODO: Add address logic
      userType: UserType.client,
      role: null,
    );

    state = await AsyncValue.guard(
        () => ref.read(usersRepositoryProvider).create(params));
  }
}
