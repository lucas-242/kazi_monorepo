part of 'services_form_cubit.dart';

sealed class ServicesFormState {
  const ServicesFormState({
    this.serviceTypes = const [],
    this.customers = const [],
    this.employees = const [],
    this.selectedServiceType,
    this.selectedStartTime,
    this.selectedEndTime,
    this.selectedCustomer,
    this.selectedEmployee,
  });

  final List<DropdownItem> serviceTypes;
  final List<DropdownItem> customers;
  final List<DropdownItem> employees;
  final String? selectedServiceType;
  final DateTime? selectedStartTime;
  final DateTime? selectedEndTime;
  final String? selectedCustomer;
  final String? selectedEmployee;
}

final class ServicesFormInitial extends ServicesFormState {
  const ServicesFormInitial({
    super.serviceTypes,
    super.customers,
    super.employees,
    super.selectedServiceType,
    super.selectedStartTime,
    super.selectedEndTime,
    super.selectedCustomer,
    super.selectedEmployee,
  });
}
