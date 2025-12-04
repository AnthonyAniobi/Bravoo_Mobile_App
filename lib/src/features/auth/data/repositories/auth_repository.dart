import 'package:bravoo/src/core/models/app_responses.dart';
import 'package:bravoo/src/core/utils/app_data_types.dart';
import 'package:bravoo/src/features/auth/data/models/user_model.dart';
import 'package:bravoo/src/features/auth/domain/entities/registration_entity.dart';
import 'package:bravoo/src/features/auth/domain/repositories/auth_datasource.dart';
import 'package:either_dart/either.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final AuthDatasource datasource;

  AuthRepository({required this.datasource});

  AsyncApiErrorOr<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await datasource.login(email, password);
      return Right(result);
    } on AuthException catch (e) {
      return Left(
        ApiError(
          message: e.message,
          statusCode: int.tryParse(e.statusCode ?? '') ?? 500,
        ),
      );
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<(UserModel, bool)> registerEmail(
    RegistrationEntity registerData,
  ) async {
    try {
      final result = await datasource.registerEmail(registerData);
      return Right((result, false));
    } on AuthException catch (e) {
      return Left(
        ApiError(
          message: e.message,
          statusCode: int.tryParse(e.statusCode ?? '') ?? 500,
        ),
      );
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<UserModel> getUser() async {
    try {
      final result = await datasource.getUser();
      return Right(result);
    } on AuthException catch (e) {
      return Left(
        ApiError(
          message: e.message,
          statusCode: int.tryParse(e.statusCode ?? '') ?? 500,
        ),
      );
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<void> initGoogleSignIn() async {
    try {
      await datasource.initGoogleSignIn();
      return Right(null);
    } on AuthException catch (e) {
      return Left(
        ApiError(
          message: e.message,
          statusCode: int.tryParse(e.statusCode ?? '') ?? 500,
        ),
      );
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<(UserModel, bool)> googleSignin() async {
    try {
      final result = await datasource.googleSignin();
      return Right((result, true));
    } on GoogleSignInException catch (e) {
      return Left(
        ApiError(
          message:
              e.description ??
              'An Error occured connecting to your Google account',
          statusCode: 500,
        ),
      );
    } on AuthException catch (e) {
      return Left(
        ApiError(
          message: e.message,
          statusCode: int.tryParse(e.statusCode ?? '') ?? 500,
        ),
      );
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<String> resetPassword(String email) async {
    try {
      final result = await datasource.resetPassword(email);
      return Right(result);
    } on AuthException catch (e) {
      return Left(
        ApiError(
          message: e.message,
          statusCode: int.tryParse(e.statusCode ?? '') ?? 500,
        ),
      );
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<void> signOut() async {
    try {
      await datasource.signOut();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(
        ApiError(
          message: e.message,
          statusCode: int.tryParse(e.statusCode ?? '') ?? 500,
        ),
      );
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }
}
