import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazi_companies/core/components/user_card/user_card.dart';
import 'package:kazi_companies/presenter/employees/cubit/employees_cubit.dart';
import 'package:kazi_core/kazi_core.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EmployeesCubit>().onInit();

    return BlocBuilder<EmployeesCubit, EmployeesState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) => state.when(
        onState: () => KaziSafeArea(
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
                    return UserCard(user: employee);
                  },
                ),
              ),
            ],
          ),
        ),
        onLoading: () => const KaziLoading(),
      ),
    );
  }
}
