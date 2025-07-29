import 'package:dartz/dartz.dart';
import 'package:task_it/core/Services/Error Handling/exports.error_handling.dart';
import 'package:task_it/core/Services/Id%20Generating/id_generating.service.dart';
import 'package:task_it/features/task/data/models/tag_model.dart';

import '../../../../../../core/params/tasks/subtask_params/tag/subtask_tag_id_params.dart';
import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../../domain/entities/tag_entity.dart';
import '../../base_task_repository_context.dart';

mixin SubtaskTagsImpl on BaseTaskRepositoryContext {
  Future<Either<Failure, TagEntity>> addSubtaskTag(SubtaskTagParams params) {
    String id = IdGeneratingService.generate();
    TagModel tag = TagModel(id: id, name: params.name);
    return executeRemoteCall<TagModel>(
      remoteCall: () => remoteDataSource.addSubtaskTag(tag),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/addSubtaskTag',
    ).then((result) => result.map((model) => model.toEntity()));
  }

  Future<Either<Failure, void>> removeSubtaskTag(SubtaskTagIdParams params) {
    return executeRemoteCall<void>(
      remoteCall: () => remoteDataSource.removeSubtaskTag(params),
      // onSuccess: (task) => localDataSource.cacheTask(task),
      location: 'TaskRepo/removeSubtaskTag',
    );
  }
}
