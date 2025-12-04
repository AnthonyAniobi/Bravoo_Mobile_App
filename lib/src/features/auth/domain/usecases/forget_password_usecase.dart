import 'package:bravoo/src/core/utils/app_data_types.dart';
import 'package:bravoo/src/features/auth/data/repositories/auth_repository.dart';

class ForgetPasswordUsecase {
  ForgetPasswordUsecase(this._authRepository);
  final AuthRepository _authRepository;

  AsyncApiErrorOr<String> call({required String email}) async {
    return _authRepository.resetPassword(email);
  }
}
