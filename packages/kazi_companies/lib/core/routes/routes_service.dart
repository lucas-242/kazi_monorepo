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
    if (_lastPage == null) {
      return;
    }

    final newPage = _lastPage!;

    _changeCubitAppPage(context, newPage);

    if (_isPushed) {
      _setRoutes(newPage);
      return _router.pop();
    }

    _setRoutes(newPage);
    _navigate(newPage);
  }

  static void openDialog<T extends Object>(
    BuildContext context, {
    Color? barrierColor,
    required Widget child,
  }) =>
      showDialog(
        context: context,
        builder: (_) => child,
      );

  static void closeDialog<T extends Object>(
    BuildContext context, [
    T? result,
  ]) =>
      _router.pop(result);
}
