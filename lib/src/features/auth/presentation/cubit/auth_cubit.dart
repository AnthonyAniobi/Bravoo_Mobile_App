import 'package:bravoo/src/core/enums/load_status_enum.dart';
import 'package:bravoo/src/core/models/app_responses.dart';
import 'package:bravoo/src/features/auth/data/models/user_model.dart';
import 'package:bravoo/src/features/auth/domain/entities/registration_entity.dart';
import 'package:bravoo/src/features/auth/domain/usecases/email_login_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/email_signup_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/get_user_data_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/google_signin_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/init_google_signin_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/signout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.emailSignUpUseCase,
    required this.emailLoginUseCase,
    required this.googleSigninUsecase,
    required this.initGoogleSigninUsecase,
    required this.getUserDataUsecase,
    required this.signoutUsecase,
  }) : super(AuthState());

  final EmailSignUpUseCase emailSignUpUseCase;
  final EmailLoginUseCase emailLoginUseCase;
  final GoogleSigninUsecase googleSigninUsecase;
  final InitGoogleSigninUsecase initGoogleSigninUsecase;
  final GetUserDataUsecase getUserDataUsecase;
  final SignoutUsecase signoutUsecase;

  // final _supabase = Supabase.instance.client;

  Future<void> init() async {
    await initGoogleSigninUsecase.call();
    final result = await getUserDataUsecase.call();
    result.fold(_loginFailed, updateLoginUser);
  }

  Future<void> getUserData() async {
    emit(state.copyWith(loadStatus: LoadStatusEnum.loading));
    final result = await getUserDataUsecase.call();
    result.fold(_loginFailed, updateLoginUser);
  }

  Future<void> login({
    required String email,
    required String password,
    required bool keepSignedIn,
  }) async {
    emit(
      state.copyWith(
        loadStatus: LoadStatusEnum.loading,
        googleSigninStatus: LoadStatusEnum.initial,
      ),
    );
    final result = await emailLoginUseCase.call(
      email: email,
      password: password,
    );
    result.fold(_loginFailed, updateLoginUser);
  }

  Future<void> registerEmail(RegistrationEntity registrationData) async {
    emit(
      state.copyWith(
        loadStatus: LoadStatusEnum.loading,
        googleSigninStatus: LoadStatusEnum.initial,
      ),
    );
    final result = await emailSignUpUseCase.call(registrationData);
    result.fold(_loginFailed, updateSignupUser);
  }

  Future<void> googleSignin() async {
    emit(
      state.copyWith(
        googleSigninStatus: LoadStatusEnum.loading,
        loadStatus: LoadStatusEnum.initial,
      ),
    );
    final result = await googleSigninUsecase.call();
    result.fold(_loginFailed, updateSignupUser);
  }

  void _loginFailed(ApiError error) {
    // dLog(
    //   'AuthCubit - _loginFailed: ${error.message}, statusCode: ${error.statusCode} ',
    // );
    emit(
      state.copyWith(
        loadStatus: LoadStatusEnum.failed,
        googleSigninStatus: LoadStatusEnum.failed,
        message: error.message,
      ),
    );
  }

  void updateLoginUser(UserModel user) {
    emit(
      state.copyWith(
        user: user,
        loadStatus: LoadStatusEnum.success,
        googleSigninStatus: LoadStatusEnum.success,
      ),
    );
  }

  void updateSignupUser((UserModel, bool) data) {
    emit(
      state.copyWith(
        user: data.$1,
        loadStatus: LoadStatusEnum.success,
        googleSigninStatus: LoadStatusEnum.success,
        emailVerified: data.$2,
      ),
    );
  }

  Future<void> signOut() async {
    emit(state.copyWith(loadStatus: LoadStatusEnum.loading));
    final result = await signoutUsecase.call();
    result.fold(_loginFailed, (_) {
      emit(AuthState());
    });
  }
}

class AuthState extends Equatable {
  final UserModel? _user;
  final LoadStatusEnum loadStatus;
  final LoadStatusEnum googleSigninStatus;
  final bool emailVerified;
  final String? message;

  UserModel get user => _user!;
  bool get isLoggedIn => _user != null;
  String get errorMessage => message ?? 'An unexpected error occurred';

  String get userEmail => _user?.email ?? '';

  const AuthState({
    UserModel? user,
    this.loadStatus = LoadStatusEnum.initial,
    this.googleSigninStatus = LoadStatusEnum.initial,
    this.emailVerified = false,
    this.message,
  }) : _user = user;

  AuthState copyWith({
    UserModel? user,
    LoadStatusEnum? loadStatus,
    LoadStatusEnum? googleSigninStatus,
    bool? emailVerified,
    String? message,
  }) {
    return AuthState(
      user: user ?? _user,
      loadStatus: loadStatus ?? this.loadStatus,
      googleSigninStatus: googleSigninStatus ?? this.googleSigninStatus,
      emailVerified: emailVerified ?? this.emailVerified,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    _user,
    loadStatus,
    message,
    googleSigninStatus,
    emailVerified,
  ];
}
