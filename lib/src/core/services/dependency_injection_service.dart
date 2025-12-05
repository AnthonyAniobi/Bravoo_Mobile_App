import 'package:bravoo/src/features/auth/data/datasources/supabase_auth_datasource.dart';
import 'package:bravoo/src/features/auth/data/repositories/auth_repository.dart';
import 'package:bravoo/src/features/auth/domain/repositories/auth_datasource.dart';
import 'package:bravoo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:bravoo/src/features/auth/domain/usecases/email_login_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/email_signup_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/get_user_data_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/google_signin_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/init_google_signin_usecase.dart';
import 'package:bravoo/src/features/auth/domain/usecases/signout_usecase.dart';
import 'package:bravoo/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bravoo/src/features/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:get_it/get_it.dart';

class GetInjectionService {
  static final inst = GetIt.instance;

  static init() {
    // datasources
    inst.registerLazySingleton<AuthDatasource>(() => SupabaseAuthDatasource());

    // repositories
    inst.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(datasource: inst<AuthDatasource>()),
    );
    // usecases
    inst.registerLazySingleton<EmailLoginUseCase>(
      () => EmailLoginUseCase(inst<AuthRepository>()),
    );
    inst.registerLazySingleton<EmailSignUpUseCase>(
      () => EmailSignUpUseCase(inst<AuthRepository>()),
    );
    inst.registerLazySingleton<GoogleSigninUsecase>(
      () => GoogleSigninUsecase(inst<AuthRepository>()),
    );
    inst.registerLazySingleton<GetUserDataUsecase>(
      () => GetUserDataUsecase(inst<AuthRepository>()),
    );
    inst.registerLazySingleton<ForgetPasswordUsecase>(
      () => ForgetPasswordUsecase(inst<AuthRepository>()),
    );
    inst.registerLazySingleton<InitGoogleSigninUsecase>(
      () => InitGoogleSigninUsecase(inst<AuthRepository>()),
    );
    inst.registerLazySingleton<SignoutUsecase>(
      () => SignoutUsecase(inst<AuthRepository>()),
    );

    // bloc services
    inst.registerLazySingleton<AuthCubit>(
      () => AuthCubit(
        emailSignUpUseCase: inst<EmailSignUpUseCase>(),
        emailLoginUseCase: inst<EmailLoginUseCase>(),
        googleSigninUsecase: inst<GoogleSigninUsecase>(),
        initGoogleSigninUsecase: inst<InitGoogleSigninUsecase>(),
        getUserDataUsecase: inst<GetUserDataUsecase>(),
        signoutUsecase: inst<SignoutUsecase>(),
      ),
    );

    inst.registerLazySingleton<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(inst<ForgetPasswordUsecase>()),
    );
  }
}
