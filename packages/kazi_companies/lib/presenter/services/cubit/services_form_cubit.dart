import 'package:bloc/bloc.dart';
import 'package:kazi_core/kazi_core.dart';
import 'package:kazi_core/shared/components/form/dropdown_item.dart';

part 'services_form_state.dart';

class ServicesFormCubit extends Cubit<ServicesFormState>
    with ServicesFormCubitMixin {
  ServicesFormCubit() : super(const ServicesFormInitial());

  void onServiceTypeChanged(DropdownItem? item) {
    if (item == null) return;

    final serviceType = item.auxValue as ServiceType;

    var endTime = state.selectedStartTime;
    if (state.selectedStartTime != null) {
      endTime = state.selectedStartTime!.add(serviceType.defaultDuration);
    }

    emitInitial(
      selectedServiceType: serviceType,
      selectedEndTime: endTime,
    );
  }

  void onStartTimeChanged(DateTime? value) {
    if (value == null) return;

    var endTime = state.selectedEndTime;
    if (state.selectedServiceType != null) {
      endTime = value.add(state.selectedServiceType!.defaultDuration);
    }

    emitInitial(selectedStartTime: value, selectedEndTime: endTime);
  }

  void onEndTimeChanged(DateTime? value) => emitInitial(selectedEndTime: value);

  void onSelectCustomer(DropdownItem? item) {
    // emit(ServicesFormServiceTypeChanged(value));
  }

  void onSelectEmployee(DropdownItem? item) {
    // emit(ServicesFormServiceTypeChanged(value));
  }
}

mixin ServicesFormCubitMixin on Cubit<ServicesFormState> {
  void emitInitial({
    List<DropdownItem>? serviceTypes,
    List<DropdownItem>? customers,
    List<DropdownItem>? employees,
    ServiceType? selectedServiceType,
    DateTime? selectedStartTime,
    DateTime? selectedEndTime,
    String? selectedCustomer,
    String? selectedEmployee,
  }) {
    emit(
      ServicesFormInitial(
        serviceTypes: serviceTypes ?? state.serviceTypes,
        customers: customers ?? state.customers,
        employees: employees ?? state.employees,
        selectedServiceType: selectedServiceType ?? state.selectedServiceType,
        selectedStartTime: selectedStartTime ?? state.selectedStartTime,
        selectedEndTime: selectedEndTime ?? state.selectedEndTime,
        selectedCustomer: selectedCustomer ?? state.selectedCustomer,
        selectedEmployee: selectedEmployee ?? state.selectedEmployee,
      ),
    );
  }
}
