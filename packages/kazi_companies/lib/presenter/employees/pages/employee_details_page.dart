import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kazi_companies/core/components/personal_info_card/personal_info_card.dart';
import 'package:kazi_companies/core/components/services_badge_list.dart';
import 'package:kazi_companies/presenter/employees/controllers/employee_details_controller.dart';
import 'package:kazi_companies/presenter/employees/controllers/employee_details_state.dart';
import 'package:kazi_core/kazi_core.dart';

class EmployeeDetailsPage extends ConsumerWidget {
  const EmployeeDetailsPage({
    super.key,
    this.id,
    this.employee,
  });
  final int? id;
  final User? employee;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeDetailsControllerProvider);

    ref.listen(employeeDetailsControllerProvider, (previous, next) {
      if (previous == null) {
        ref
            .read(employeeDetailsControllerProvider.notifier)
            .onInit(employee: employee, employeeId: id);
      }
    });

    return KaziSafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: KaziInsets.xxLg),
          child: switch (state) {
            EmployeeDetailsLoading() => const KaziLoading(),
            EmployeeDetailsInitial() => Column(
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
              ),
          },
        ),
      ),
    );
  }
}
