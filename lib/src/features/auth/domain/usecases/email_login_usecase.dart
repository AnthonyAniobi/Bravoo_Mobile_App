import 'package:bravoo/src/core/utils/app_data_types.dart';
import 'package:bravoo/src/features/auth/data/models/user_model.dart';
import 'package:bravoo/src/features/auth/domain/repositories/auth_repository.dart';

class EmailLoginUseCase {
  EmailLoginUseCase(this._authRepository);
  final AuthRepository _authRepository;

  AsyncApiErrorOr<UserModel> call({
    required String email,
    required String password,
  }) async {
    return _authRepository.login(email: email, password: password);
  }
}
