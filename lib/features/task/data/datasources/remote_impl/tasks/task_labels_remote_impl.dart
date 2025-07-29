import '../../../../../../core/params/tasks/task_params/label/task_label_id_params.dart';
import '../../../models/label_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskLabelsRemoteImpl on BaseTaskRemoteContext {
  Future<LabelModel> addTaskLabel(LabelModel params) {
    // TODO: implement addTaskLabel
    throw UnimplementedError();
  }

  Future<void> removeTaskLabel(TaskLabelIdParams params) {
    // TODO: implement removeTaskLabel
    throw UnimplementedError();
  }
}
