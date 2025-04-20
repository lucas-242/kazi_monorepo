import 'package:bloc/bloc.dart';
import 'package:kazi_core/shared/components/form/dropdown_item.dart';

part 'services_form_state.dart';

class ServicesFormCubit extends Cubit<ServicesFormState> {
  ServicesFormCubit() : super(const ServicesFormInitial());

  void onServiceTypeChanged(DropdownItem? item) {
    // emit(ServicesFormServiceTypeChanged(value));
  }

  void onStartTimeChanged(DateTime? value) {
    // emit(ServicesFormStartTimeChanged(value));
  }

  void onEndTimeChanged(DateTime? value) {
    // emit(ServicesFormStartTimeChanged(value));
  }

  void onSelectCustomer(DropdownItem? item) {
    // emit(ServicesFormServiceTypeChanged(value));
  }

  void onSelectEmployee(DropdownItem? item) {
    // emit(ServicesFormServiceTypeChanged(value));
  }
}
