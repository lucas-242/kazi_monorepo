import 'package:kazi_core/kazi_core.dart';

abstract interface class ServiceTypeRepository {
  Future<List<ServiceType>> get();
}
