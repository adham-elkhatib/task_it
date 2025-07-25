import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/tag_entity.dart';
import '../../../models/tag_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskTagsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TagEntity>> addTaskTag(TaskTagParams params) {
    return executeRemoteCall<TagModel>(
      remoteCall: () => remoteDataSource.addTaskTag(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskTag',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> removeTaskTag(TaskTagParams params) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.removeTaskTag(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeTaskTag',
    );
  }
}
