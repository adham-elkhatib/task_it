import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/checklist_item_model.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/checklist_item_entity.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskChecklistImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, ChecklistItemEntity>> addSubtaskChecklist(
    SubtaskChecklistParams params,
  ) {
    return executeRemoteCall<ChecklistItemModel>(
      remoteCall: () => remoteDataSource.addSubtaskChecklist(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, ChecklistItemEntity>> updateSubtaskChecklist(
    SubtaskChecklistParams params,
  ) {
    return executeRemoteCall<ChecklistItemModel>(
      remoteCall: () => remoteDataSource.updateSubtaskChecklist(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateSubtaskChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> deleteSubtaskChecklist(
    SubtaskChecklistIdParams params,
  ) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteSubtaskChecklist(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteSubtaskChecklist',
    );
  }
}
