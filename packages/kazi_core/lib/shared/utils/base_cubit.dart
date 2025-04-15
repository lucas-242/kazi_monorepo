import 'package:bloc/bloc.dart';
import 'package:kazi_core/shared/l10n/generated/l10n.dart';
import 'package:kazi_core/shared/models/errors.dart';

import 'base_state.dart';

mixin BaseCubit<T extends BaseState> on Cubit<T> {
  void onAppError(AppError error) {
    emit(
      state.copyWith(
        callbackMessage: error.message,
        status: StateStatus.error,
      ) as T,
    );
  }

  void unexpectedError(Object exception) {
    emit(
      state.copyWith(
        callbackMessage: KaziLocalizations.current.errorUnknowError,
        status: StateStatus.error,
      ) as T,
    );
  }
}
