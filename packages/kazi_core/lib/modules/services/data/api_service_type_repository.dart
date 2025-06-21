import 'package:kazi_core/modules/services/data/mocks/service_type_mock.dart';
import 'package:kazi_core/modules/services/domain/repositories/service_type_repository.dart';
import 'package:kazi_core/shared/entities/service_type.dart';

final class ApiServiceTypeRepository implements ServiceTypeRepository {
  @override
  Future<List<ServiceType>> get() async {
    await Future.delayed(const Duration(seconds: 1));
    return ServiceTypeMock.all;
  }
}
