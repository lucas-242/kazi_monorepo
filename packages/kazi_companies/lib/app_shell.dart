import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kazi_companies/app_cubit.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_companies/domain/models/menu.dart';
import 'package:kazi_core/kazi_core.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final List<Menu> menus = [
    Menu(
      KaziLocalizations.current.services,
      KaziSvgAssets.services,
      AppPages.services,
    ),
    Menu(
      KaziLocalizations.current.clients,
      KaziSvgAssets.person,
      AppPages.clients,
    ),
    Menu(
      KaziLocalizations.current.employees,
      KaziSvgAssets.calculator,
      AppPages.employees,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: KaziPaddingWrap(
          paddingTop: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: KaziInsets.sm,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: KaziInsets.xs),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: KaziColors.primary,
                      borderRadius: BorderRadius.circular(KaziInsets.xxs),
                    ),
                    child: const KaziSvg(KaziSvgAssets.logo),
                  ),
                  const Text('Kazi'),
                ],
              ),
              const Spacer(),
              Row(
                children: menus
                    .map(
                      (m) => KaziTextButton(
                        onTap: () => context.navigateTo(m.route),
                        text: m.name,
                        color: cubit.state == m.route
                            ? KaziColors.primary
                            : KaziColors.grey,
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Row(
                spacing: KaziInsets.md,
                children: [
                  if (cubit.state == AppPages.clients)
                    KaziElevatedButton.icon(
                      onTap: () {},
                      icon: const Icon(Icons.add),
                      label: KaziLocalizations.current.newClient,
                    ),
                  const CircleAvatar(
                    radius: 24,
                    child: KaziSvg(KaziSvgAssets.person),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) => context.showLeftBottomSheet().then(
          (_) {
            if (context.mounted) context.pop();
          },
        ),
        child: widget.child,
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
