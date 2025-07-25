import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kazi_companies/core/components/user_card/user_card.dart';
import 'package:kazi_companies/presenter/employees/controllers/employees_controller.dart';
import 'package:kazi_core/kazi_core.dart';

class EmployeesPage extends ConsumerWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(employeesControllerProvider);

    return provider.when(
      loading: () => const KaziLoading(),
      error: (error, stackTrace) => KaziError(message: error.toString()),
      data: (state) => switch (state) {
        EmployeesInitialState() => KaziSafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KaziPageTitle(
                  title: KaziLocalizations.current.employees,
                  searchLabel: 'Buscar Funcionários...',
                  onFilter: () {},
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: context.width / 3,
                      crossAxisSpacing: KaziInsets.md,
                      mainAxisSpacing: KaziInsets.md,
                    ),
                    itemCount: state.employees.length,
                    itemBuilder: (context, index) {
                      final employee = state.employees[index];
                      return UserCard(
                        user: employee,
                        onEdit: (user) {},
                        onDelete: (user) {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      },
    );
  }
}
