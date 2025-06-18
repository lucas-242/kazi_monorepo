import 'package:kazi_core/shared/entities/user.dart';

sealed class EmployeesState {
  const EmployeesState({required this.employees});

  final List<User> employees;
}

final class EmployeesInitial extends EmployeesState {
  const EmployeesInitial({required super.employees});
}

final class EmployeesLoading extends EmployeesState {
  const EmployeesLoading({required super.employees});
}
