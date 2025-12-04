import 'package:bravoo/src/features/auth/data/models/user_model.dart';
import 'package:bravoo/src/features/auth/domain/entities/registration_entity.dart';

abstract class AuthDatasource {
  Future<UserModel> login(String email, String password);

  Future<UserModel> registerEmail(RegistrationEntity registerData);

  Future<UserModel> getUser();

  Future<void> initGoogleSignIn();

  Future<UserModel> googleSignin();

  Future<String> resetPassword(String email);

  Future<void> signOut();
}
