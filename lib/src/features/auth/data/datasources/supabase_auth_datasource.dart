import 'dart:io';

import 'package:bravoo/src/core/utils/app_utils.dart';
import 'package:bravoo/src/features/auth/data/models/user_model.dart';
import 'package:bravoo/src/features/auth/domain/entities/registration_entity.dart';
import 'package:bravoo/src/features/auth/domain/repositories/auth_datasource.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthDatasource extends AuthDatasource {
  final _supabase = Supabase.instance.client;
  final _google = GoogleSignIn.instance;

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return UserModel.fromSupabaseUser(response.user!);
  }

  @override
  Future<UserModel> registerEmail(RegistrationEntity registerData) async {
    final response = await _supabase.auth.signUp(
      email: registerData.email,
      password: registerData.password,
      data: {'full_name': '${registerData.fullName}'},
    );
    return UserModel.fromSupabaseUser(response.user!);
  }

  @override
  Future<UserModel> getUser() async {
    return UserModel.fromSupabaseUser(_supabase.auth.currentUser!);
    // final response = await _supabase.auth.getUser();
    // return response.user!;
  }

  @override
  Future<void> initGoogleSignIn() async {
    if (!_google.supportsAuthenticate()) {
      throw Exception('Google Sign-In is not supported on this platform.');
    }
    final clientId = Platform.isIOS
        ? AppUtils.googleIosClientId
        : AppUtils.googleAndroidClientId;

    if (Platform.isIOS || Platform.isAndroid) {
      await _google.initialize(
        clientId: clientId,
        serverClientId: AppUtils.googleServerId,
      );
    } else {
      throw Exception('Google Sign-In is not supported on this platform.');
    }
  }

  @override
  Future<UserModel> googleSignin() async {
    try {
      if (!_google.supportsAuthenticate()) {
        throw Exception('Google Sign-In is not supported on this platform.');
      }

      final googleAccount = await _google.authenticate();
      final googleAuthorization = await googleAccount.authorizationClient
          .authorizationForScopes(['email', 'profile']);
      final googleAuthentication = googleAccount.authentication;
      final idToken = googleAuthentication.idToken;
      final accessToken = googleAuthorization?.accessToken;

      if (idToken == null) {
        throw 'No ID Token found.';
      }
      if (accessToken == null) {
        throw 'No Access Token found.';
      }

      final response = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      return UserModel.fromSupabaseUser(response.user!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> resetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
    return 'Password reset email sent to $email';
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
