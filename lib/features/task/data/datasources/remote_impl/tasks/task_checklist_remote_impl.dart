import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/checklist_item_model.dart';
import '../../../models/task_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskChecklistRemoteImpl on BaseTaskRemoteContext {
  Future<TaskModel> addChecklist(ChecklistItemModel params) {
    // TODO: implement addChecklist
    throw UnimplementedError();
  }

  Future<TaskModel> updateChecklist(ChecklistItemModel params) {
    // TODO: implement updateChecklist
    throw UnimplementedError();
  }

  Future<TaskModel> deleteChecklist(TaskChecklistItemIdParams params) {
    // TODO: implement deleteChecklist
    throw UnimplementedError();
  }
}
