import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/subtask_entity.dart';
import '../../../models/subtask_model.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskAssigneesImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, SubtaskEntity>> addSubtaskAssignee(
    SubtaskAssigneeParams params,
  ) {
    // todo add params

    SubtaskModel subtask = SubtaskModel(
      id: params.subtaskId,
      title: "params.title",
      assigneeIds: [],
      deadline: DateTime.now(),
      isCompleted: false,
    );

    return executeRemoteCall<SubtaskModel>(
      remoteCall: () => remoteDataSource.addSubtaskAssignee(subtask),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskAssignee',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> removeSubtaskAssignee(
    SubtaskAssigneeParams params,
  ) {
    // todo add params
    SubtaskModel subtask = SubtaskModel(
      id: params.subtaskId,
      title: "params.title",
      assigneeIds: [],
      deadline: DateTime.now(),
      isCompleted: false,
    );
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.removeSubtaskAssignee(subtask),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeSubtaskAssignee',
    );
  }
}
