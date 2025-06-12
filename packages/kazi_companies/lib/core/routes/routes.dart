export 'app_navigator.dart';
export 'app_pages.dart';
export 'app_router.dart';
export 'extensions/routes_extensions.dart';

abstract class Routes {
  //Main Routes
  static const initial = '/';
  static const home = services;

  // Clients
  static const clients = '/clients';

  // Services
  static const services = '/services';

  // Employees
  static const employees = '/employees';
  static const addEmployee = '/employees/add';
  static const updateEmployee = '/employees/update';

  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const forgotPassword = '/forgot-password';
  static const privacyPolicy = '/privacy-policy';
  static const resetPassword = 'reset-password';
}
