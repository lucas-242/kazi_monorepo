import 'package:get_it/get_it.dart';

abstract class ServiceLocator {
  static final _instance = GetIt.instance;

  static T get<T extends Object>() => _instance.get<T>();
}
