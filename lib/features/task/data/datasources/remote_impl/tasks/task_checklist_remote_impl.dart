import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/checklist_item_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskChecklistRemoteImpl on BaseTaskRemoteContext {
  Future<ChecklistItemModel> addChecklistItem(ChecklistItemModel model) {
    // TODO: implement addChecklist
    throw UnimplementedError();
  }

  Future<ChecklistItemModel> updateChecklistItem(ChecklistItemModel model) {
    // TODO: implement updateChecklist
    throw UnimplementedError();
  }

  Future<void> deleteChecklistItem(TaskChecklistIdParams params) {
    // TODO: implement deleteChecklist
    throw UnimplementedError();
  }
}
