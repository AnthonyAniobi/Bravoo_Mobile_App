import 'package:bravoo/src/core/models/app_responses.dart';
import 'package:either_dart/either.dart';

typedef AsyncApiErrorOr<T> = Future<Either<ApiError, T>>;
typedef ApiErrorOr<T> = Either<ApiError, T>;
