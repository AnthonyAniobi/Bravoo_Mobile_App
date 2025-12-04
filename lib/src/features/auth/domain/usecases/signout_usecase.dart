import 'package:bravoo/src/core/utils/app_data_types.dart';
import 'package:bravoo/src/features/auth/domain/repositories/auth_repository.dart';

class SignoutUsecase {
  SignoutUsecase(this._authRepository);
  final AuthRepository _authRepository;

  AsyncApiErrorOr<void> call() async {
    return _authRepository.signOut();
  }
}
