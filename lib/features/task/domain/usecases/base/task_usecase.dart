import 'package:dartz/dartz.dart';

import '../../../../../core/Services/Error Handling/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
