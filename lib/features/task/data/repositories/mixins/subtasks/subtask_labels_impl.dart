import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/features/task/data/models/label_model.dart';

import '../../../../../../core/Services/Id Generating/id_generating.service.dart';
import '../../../../../../core/params/tasks/subtask_params/label/subtask_label_id_params.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/label_entity.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskLabelsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, LabelEntity>> addSubtaskLabel(
    SubtaskLabelParams params,
  ) {
    String id = IdGeneratingService.generate();
    LabelModel label = LabelModel(
      id: id,
      name: params.name,
      colorHex: params.colorHex,
    );
    return executeRemoteCall<LabelModel>(
      remoteCall: () => remoteDataSource.addSubtaskLabel(label),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskLabel',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> removeSubtaskLabel(
    SubtaskLabelIdParams params,
  ) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.removeSubtaskLabel(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeSubtaskLabel',
    );
  }
}
