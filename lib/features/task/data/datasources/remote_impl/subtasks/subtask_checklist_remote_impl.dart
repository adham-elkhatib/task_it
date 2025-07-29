import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/checklist_item_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskChecklistRemoteImpl on BaseTaskRemoteContext {
  Future<ChecklistItemModel> addSubtaskChecklist(ChecklistItemModel model) {
    // TODO: implement addSubtaskChecklist
    throw UnimplementedError();
  }

  Future<ChecklistItemModel> updateSubtaskChecklist(ChecklistItemModel model) {
    // TODO: implement updateSubtaskChecklist
    throw UnimplementedError();
  }

  Future<void> deleteSubtaskChecklist(SubtaskChecklistIdParams params) {
    // TODO: implement deleteSubtaskChecklist
    throw UnimplementedError();
  }
}
