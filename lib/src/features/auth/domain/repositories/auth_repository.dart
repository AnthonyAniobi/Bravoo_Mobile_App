import 'package:bravoo/src/core/models/app_responses.dart';
import 'package:bravoo/src/core/utils/app_data_types.dart';
import 'package:bravoo/src/features/auth/data/models/user_model.dart';
import 'package:bravoo/src/features/auth/domain/entities/registration_entity.dart';
import 'package:bravoo/src/features/auth/domain/repositories/auth_datasource.dart';
import 'package:either_dart/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  final AuthDatasource datasource;

  AuthRepository({required this.datasource});

  AsyncApiErrorOr<UserModel> login({
    required String email,
    required String password,
  });

  AsyncApiErrorOr<(UserModel, bool)> registerEmail(
    RegistrationEntity registerData,
  );

  AsyncApiErrorOr<UserModel> getUser();

  AsyncApiErrorOr<void> initGoogleSignIn();

  AsyncApiErrorOr<(UserModel, bool)> googleSignin();

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
