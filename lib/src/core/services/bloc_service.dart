import 'package:bravoo/src/core/services/dependency_injection_service.dart';
import 'package:bravoo/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocService {
  static get providers => [
    //
    BlocProvider(
      create: (context) => GetInjectionService.inst<AuthCubit>()..init(),
    ),
  ];
}
