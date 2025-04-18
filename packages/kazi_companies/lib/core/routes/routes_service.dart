import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/app_cubit.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_core/kazi_core.dart';

class RoutesService {
  static final GoRouter _router = RoutesConfig.router;

  static AppPages? _lastPage;
  static AppPages? _currentPage;
  static bool _isPushed = false;

  static AppPages? get lastRoute => _lastPage;
  static AppPages? get activeRoute => _currentPage;
  static bool get isPushed => _isPushed;

  static void openDrawer(BuildContext context) =>
      Scaffold.of(context).openDrawer();

  static void closeDrawer(BuildContext context) =>
      Scaffold.of(context).closeDrawer();

  static void navigateTo(
    BuildContext context,
    AppPages page, {
    int? id,
    Service? service,
    String? token,
    WebViewParams? webViewParams,
  }) {
    _setRoutes(page);

    final params = RouteParams(
      id: id,
      service: service,
      token: token,
      webViewParams: webViewParams,
    );

    _changeCubitAppPage(context, page);
    _navigate(page, params);
  }

  static void _setRoutes(AppPages page, [bool isPushed = false]) {
    _lastPage = _currentPage;
    _currentPage = page;
    _isPushed = isPushed;
  }

  static void _changeCubitAppPage(BuildContext context, AppPages newPage) {
    final cubit = context.read<AppCubit>();
    cubit.changePage(newPage);
  }

  static void _navigate(AppPages page, [RouteParams? params]) =>
      _router.go(AppPages.getRoute(page, id: params?.id), extra: params);

  static void pushTo(
    BuildContext context,
    AppPages page, {
    int? id,
    Service? service,
    String? token,
    WebViewParams? webViewParams,
  }) {
    _setRoutes(page, true);

    final params = RouteParams(
      id: id,
      service: service,
      token: token,
      webViewParams: webViewParams,
    );

    _changeCubitAppPage(context, page);
    _push(page, params);
  }

  static void _push(AppPages page, [RouteParams? params]) => _router.push(
        AppPages.getRoute(page, id: params?.id),
        extra: params,
      );

  static void navigateBack(BuildContext context) {
    final newPage = _lastPage;

    if (newPage == null) {
      return _router.pop();
    }

    _changeCubitAppPage(context, newPage);

    if (_isPushed) {
      _setRoutes(newPage);
      return _router.pop();
    }

    _setRoutes(newPage);
    _navigate(newPage);
  }

  static void navigateToAddServices(BuildContext context, [Service? service]) {
    var newPage = AppPages.addServices;
    _isPushed = true;

    if (_currentPage == AppPages.addServices) {
      _isPushed = false;
      newPage = _getLastPageFromAddServicesPage();
    }

    _lastPage = _currentPage;
    _currentPage = newPage;

    final params = RouteParams(service: service);

    _changeCubitAppPage(context, newPage);
    _push(newPage, params);
  }

  /// Used to avoid navigate to a dynamic route.
  ///
  /// TODO: Change it in the future to load data everytime the user move to a dynamic route.
  static AppPages _getLastPageFromAddServicesPage() =>
      _lastPage == AppPages.services ? AppPages.services : AppPages.services;
}
