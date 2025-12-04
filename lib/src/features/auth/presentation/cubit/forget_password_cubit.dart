import 'package:bravoo/src/core/enums/load_status_enum.dart';
import 'package:bravoo/src/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUsecase)
    : super(const ForgetPasswordState());

  final ForgetPasswordUsecase forgetPasswordUsecase;

  Future<void> forgetPassword(String email) async {
    emit(state.copy(forgetPasswordStatus: LoadStatusEnum.loading));
    final result = await forgetPasswordUsecase.call(email: email);
    result.fold(
      (error) {
        emit(
          state.copy(
            forgetPasswordStatus: LoadStatusEnum.failed,
            errorMessage: error.message,
          ),
        );
      },
      (_) {
        emit(
          state.copy(
            forgetPasswordStatus: LoadStatusEnum.success,
            email: email,
          ),
        );
      },
    );
  }

  void reset() {
    emit(const ForgetPasswordState());
  }
}

class ForgetPasswordState extends Equatable {
  final String? email;
  final LoadStatusEnum forgetPasswordStatus;
  final String? errorMessage;

  const ForgetPasswordState({
    this.email,
    this.forgetPasswordStatus = LoadStatusEnum.initial,
    this.errorMessage,
  });

  ForgetPasswordState copy({
    String? email,
    LoadStatusEnum? forgetPasswordStatus,
    String? errorMessage,
  }) {
    return ForgetPasswordState(
      email: email ?? this.email,
      forgetPasswordStatus: forgetPasswordStatus ?? this.forgetPasswordStatus,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, forgetPasswordStatus, errorMessage];
}
