import 'package:kazi_core/shared/entities/user.dart';

sealed class EmployeeDetailsState {
  const EmployeeDetailsState({required this.employee});

  final User? employee;
}

final class EmployeeDetailsInitial extends EmployeeDetailsState {
  const EmployeeDetailsInitial({required super.employee});
}

final class EmployeeDetailsLoading extends EmployeeDetailsState {
  const EmployeeDetailsLoading({required super.employee});
}
