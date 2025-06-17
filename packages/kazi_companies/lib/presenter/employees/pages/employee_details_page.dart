import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazi_companies/core/components/personal_info_card/personal_info_card.dart';
import 'package:kazi_companies/core/components/services_badge_list.dart';
import 'package:kazi_companies/presenter/employees/cubit/employees_cubit.dart';
import 'package:kazi_core/kazi_core.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({
    super.key,
    this.id,
    required this.viewState,
  });
  final int? id;
  final ViewState viewState;

  @override
  Widget build(BuildContext context) {
    context.read<EmployeesCubit>().onInit(employeeId: id);

    return KaziSafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: KaziInsets.xxLg),
          child: BlocBuilder<EmployeesCubit, EmployeesState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              if (state.status == StateStatus.loading) {
                const KaziLoading();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalInfoCard(user: state.employee!),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(KaziInsets.xLg),
                      child: Column(
                        spacing: KaziInsets.md,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Especialidades',
                            style: KaziTextStyles.headlineSm,
                          ),
                          ServicesBadgeList(user: state.employee!),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
