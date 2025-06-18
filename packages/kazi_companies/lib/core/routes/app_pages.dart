import 'package:kazi_companies/core/routes/routes.dart';

enum AppPages {
  home(0, Routes.home),
  clients(1, Routes.clients),
  employees(2, Routes.employees);

  const AppPages(this.indexPage, this.route);

  final int indexPage;
  final String route;

  static AppPages fromIndex(int value) {
    for (AppPages page in AppPages.values) {
      if (page.indexPage == value) {
        return page;
      }
    }

    return home;
  }

  static AppPages? fromRoute(String route) {
    switch (route) {
      case Routes.home:
        return AppPages.home;
      case Routes.clients:
        return AppPages.clients;
      case Routes.employees:
        return AppPages.employees;
      default:
        if (route.startsWith(Routes.clients)) {
          return AppPages.clients;
        }
        if (route.startsWith(Routes.employees)) {
          return AppPages.employees;
        }
        return null;
    }
  }
}
