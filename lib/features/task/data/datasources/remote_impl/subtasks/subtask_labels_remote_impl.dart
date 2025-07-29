import '../../../../../../core/params/tasks/subtask_params/label/subtask_label_id_params.dart';
import '../../../models/label_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskLabelsRemoteImpl on BaseTaskRemoteContext {
  Future<LabelModel> addSubtaskLabel(LabelModel params) {
    // TODO: implement addSubtaskLabel
    throw UnimplementedError();
  }

  Future<void> removeSubtaskLabel(SubtaskLabelIdParams params) {
    // TODO: implement removeSubtaskLabel
    throw UnimplementedError();
  }
}
