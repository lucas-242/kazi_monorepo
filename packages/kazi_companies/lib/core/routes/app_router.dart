import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/app_shell.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/presenter/clients/models/client_info.dart';
import 'package:kazi_companies/presenter/clients/pages/client_details_page.dart';
import 'package:kazi_companies/presenter/clients/pages/clients_page.dart';
import 'package:kazi_companies/presenter/employees/pages/employee_details_page.dart';
import 'package:kazi_companies/presenter/employees/pages/employees_page.dart';
import 'package:kazi_companies/presenter/employees/pages/employees_shell.dart';
import 'package:kazi_companies/presenter/initial/pages/splash_page.dart';
import 'package:kazi_companies/presenter/services/pages/services_page.dart';
import 'package:kazi_core/kazi_core.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.initial,
    routes: [
      ..._initialRoutes,
      _appShellRoutes,
    ],
  );

  static final _initialRoutes = [
    GoRoute(
      path: Routes.initial,
      pageBuilder: (context, state) =>
          _customTransition(state, const SplashPage()),
    ),
  ];

  static final _appShellRoutes = ShellRoute(
    builder: (context, state, child) => AppShell(child: child),
    routes: [
      GoRoute(
        path: Routes.services,
        pageBuilder: (context, state) =>
            _customTransition(state, const ServicesPage()),
      ),
      GoRoute(
        path: Routes.clients,
        pageBuilder: (context, state) =>
            _customTransition(state, const ClientsPage()),
      ),
      GoRoute(
        path: '${Routes.clients}/:clientId',
        pageBuilder: (context, state) => _customTransition(
          state,
          ClientDetailsPage(
            client: state.extra as ClientInfo?,
            clientId: state.pathParameters['clientId'],
          ),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            EmployeesShell(employeeId: _getId(state), child: child),
        routes: [
          GoRoute(
            path: Routes.employees,
            builder: (context, state) => const EmployeesPage(),
          ),
          GoRoute(
            path: Routes.addEmployee,
            builder: (context, state) =>
                const EmployeeDetailsPage(viewState: ViewState.create),
          ),
          GoRoute(
            path: '${Routes.updateEmployee}/:id',
            builder: (context, state) => EmployeeDetailsPage(
              id: _getId(state),
              viewState: ViewState.update,
            ),
          ),
          GoRoute(
            path: '${Routes.employees}/:id',
            builder: (context, state) => EmployeeDetailsPage(
              id: _getId(state),
              viewState: ViewState.read,
            ),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage<Widget> _customTransition(
    GoRouterState state,
    Widget child,
  ) {
    final Tween<Offset> bottomUpTween = Tween<Offset>(
      begin: const Offset(0.0, 0.25),
      end: Offset.zero,
    );
    final Animatable<double> fastOutSlowInTween =
        CurveTween(curve: Curves.fastOutSlowIn);
    final Animatable<double> easeInTween = CurveTween(curve: Curves.easeIn);

    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(bottomUpTween.chain(fastOutSlowInTween)),
          child: FadeTransition(
            opacity: easeInTween.animate(animation),
            child: child,
          ),
        );
      },
    );
  }

  static int? _getId(GoRouterState state) =>
      int.tryParse(state.pathParameters.values.firstOrNull ?? '');
}
