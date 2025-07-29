import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';
import 'package:task_it/features/task/data/models/subtask_model.dart';
import 'package:task_it/features/task/data/repositories/base_task_repository_context.dart';

import '../../../../../../core/params/tasks/subtask_params/crud/update_subtask_params.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/subtask_entity.dart';

mixin SubtaskCrudImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, List<SubtaskEntity>>> getSubtasksByTaskId(
    SubtaskIdParams params,
  ) {
    return executeRemoteCall<List<SubtaskModel>>(
      remoteCall: () => remoteDataSource.getSubtasksByTaskId(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'Subtask/add',
    );
    // todo return map here
  }

  Future<Either<Failure, SubtaskEntity>> addSubtask(
    CreateSubtaskParams params,
  ) async {
    String id = IdGeneratingService.generate();
    SubtaskModel subtask = SubtaskModel(
      id: id,
      title: params.title,
      assigneeIds: params.assigneeId,
      deadline: params.deadline,
      isCompleted: false,
    );

    return executeRemoteCall<SubtaskModel>(
      remoteCall: () => remoteDataSource.addSubtask(subtask),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'Subtask/add',
    );
  }

  Future<Either<Failure, SubtaskEntity>> updateSubtask(
    UpdateSubtaskParams params,
  ) async {
    SubtaskModel subtask = SubtaskModel(
      id: params.subtaskId,
      title: params.title,
      assigneeIds: params.assigneeId,
      deadline: params.deadline,
      isCompleted: false,
    );

    return executeRemoteCall<SubtaskModel>(
      remoteCall: () => remoteDataSource.updateSubtask(subtask),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'Subtask/update',
    );
  }

  Future<Either<Failure, void>> deleteSubtask(SubtaskIdParams params) async {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteSubtask(params),
      // onSuccess: (task) => localDataSource.removeSubtask(params.subtaskId),
      location: 'Subtask/delete',
    );
  }
}
