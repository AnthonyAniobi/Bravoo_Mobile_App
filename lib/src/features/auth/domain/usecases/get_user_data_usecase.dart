import 'package:bravoo/src/core/utils/app_data_types.dart';
import 'package:bravoo/src/features/auth/data/models/user_model.dart';
import 'package:bravoo/src/features/auth/data/repositories/auth_repository.dart';

class GetUserDataUsecase {
  GetUserDataUsecase(this._authRepository);
  final AuthRepository _authRepository;

  AsyncApiErrorOr<UserModel> call() async {
    return _authRepository.getUser();
  }
}
