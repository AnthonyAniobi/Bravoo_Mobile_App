import 'package:bravoo/src/core/utils/app_data_types.dart';
import 'package:bravoo/src/features/auth/data/models/user_model.dart';
import 'package:bravoo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:bravoo/src/features/auth/domain/entities/registration_entity.dart';

class EmailSignUpUseCase {
  EmailSignUpUseCase(this._authRepository);
  final AuthRepository _authRepository;

  AsyncApiErrorOr<(UserModel, bool)> call(
    RegistrationEntity registration,
  ) async {
    return _authRepository.registerEmail(registration);
  }
}
