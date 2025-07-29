import '../../../../../../core/params/tasks/subtask_params/tag/subtask_tag_id_params.dart';
import '../../../models/tag_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskTagsRemoteImpl on BaseTaskRemoteContext {
  Future<TagModel> addSubtaskTag(TagModel params) {
    // TODO: implement addSubtaskTag
    throw UnimplementedError();
  }

  Future<void> removeSubtaskTag(SubtaskTagIdParams params) {
    // TODO: implement removeSubtaskTag
    throw UnimplementedError();
  }
}
