import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';

import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/checklist_item_entity.dart';
import '../../../models/checklist_item_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskChecklistImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, ChecklistItemEntity>> addChecklistItem(
    TaskChecklistParams params,
  ) {
    return executeRemoteCall<ChecklistItemModel>(
      remoteCall: () => remoteDataSource.addChecklist(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, ChecklistItemEntity>> updateChecklistItem(
    TaskChecklistParams params,
  ) {
    return executeRemoteCall<ChecklistItemModel>(
      remoteCall: () => remoteDataSource.updateChecklist(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> deleteChecklist(TaskChecklistIdParams params) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteChecklist(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteChecklist',
    );
  }
}
