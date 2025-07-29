import '../../../../../../core/params/tasks/task_params/tag/task_tag_id_params.dart';
import '../../../models/tag_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskTagsRemoteImpl on BaseTaskRemoteContext {
  Future<TagModel> addTaskTag(TagModel params) {
    // TODO: implement removeTaskLabel
    throw UnimplementedError();
  }

  Future<void> removeTaskTag(TaskTagIdParams params) {
    // TODO: implement addTaskLabel
    throw UnimplementedError();
  }
}
