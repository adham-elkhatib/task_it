import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/errors/failure.dart';
import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';

import '../../../../../../core/params/tasks/task_params/label/task_label_id_params.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/label_entity.dart';
import '../../../models/label_model.dart';
import '../../base_task_repository_context.dart';

mixin TaskLabelsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, LabelEntity>> addTaskLabel(TaskLabelParams params) {
    String id = IdGeneratingService.generate();

    LabelModel labelModel = LabelModel(
      id: id,
      name: params.label,
      colorHex: params.colorHex,
    );
    return executeRemoteCall<LabelModel>(
      remoteCall: () => remoteDataSource.addTaskLabel(labelModel),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addTaskLabel',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> removeTaskLabel(TaskLabelIdParams params) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.removeTaskLabel(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeTaskLabel',
    );
  }
}
