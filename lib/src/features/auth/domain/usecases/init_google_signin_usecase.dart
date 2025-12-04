import 'package:bravoo/src/core/utils/app_data_types.dart';

import 'package:bravoo/src/features/auth/data/repositories/auth_repository.dart';
import 'package:bravoo/src/features/auth/domain/entities/registration_entity.dart';

class InitGoogleSigninUsecase {
  InitGoogleSigninUsecase(this._authRepository);
  final AuthRepository _authRepository;

  AsyncApiErrorOr<void> call() async {
    return _authRepository.initGoogleSignIn();
  }
}
