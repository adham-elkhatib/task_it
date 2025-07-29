import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';

import '../../../../../../core/Services/Id Generating/id_generating.service.dart';
import '../../../../../../core/params/tasks/task_params/checklist/update_task_checklist_item_params.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/checklist_item_entity.dart';
import '../../../models/checklist_item_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskChecklistImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, ChecklistItemEntity>> addChecklistItem(
    CreateTaskChecklistItemParams params,
  ) {
    String id = IdGeneratingService.generate();
    ChecklistItemModel checklistItem = ChecklistItemModel(
      id: id,
      content: params.content,
      isChecked: false,
    );
    return executeRemoteCall<ChecklistItemModel>(
      remoteCall: () => remoteDataSource.addChecklistItem(checklistItem),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, ChecklistItemEntity>> updateChecklistItem(
    UpdateTaskChecklistItemParams params,
  ) {
    ChecklistItemModel checklistItem = ChecklistItemModel(
      id: params.checklistItemId,
      content: params.content,
      isChecked: false,
    );
    return executeRemoteCall<ChecklistItemModel>(
      remoteCall: () => remoteDataSource.updateChecklistItem(checklistItem),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/updateChecklist',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> deleteChecklistItem(
    TaskChecklistIdParams params,
  ) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.deleteChecklistItem(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/deleteChecklistItem',
    );
  }
}
