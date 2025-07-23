import 'package:dartz/dartz.dart';

import '../../../../core/Services/Auth/auth.service.dart';
import '../../../../core/Services/Error Handling/errors/failure.dart';
import '../../../../core/connection/network_info.dart';
import '../datasources/remote_impl/task_remote_data_source.dart';
import '../datasources/task_local_data_source.dart';

abstract class BaseTaskRepositoryContext {
  final AuthService authService;
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BaseTaskRepositoryContext({
    required this.authService,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  Future<Either<Failure, T>> executeRemoteCall<T>({
    required Future<T> Function() remoteCall,
    Future<void> Function(T result)? onSuccess,
    String location,
  });

  String? get currentUserId => authService.getCurrentUserId();
}
