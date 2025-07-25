import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/checklist_item_model.dart';
import '../../../models/subtask_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskChecklistRemoteImpl on BaseTaskRemoteContext {
  Future<SubtaskModel> addSubtaskChecklist(ChecklistItemModel params) {
    // TODO: implement addSubtaskChecklist
    throw UnimplementedError();
  }

  Future<SubtaskModel> updateSubtaskChecklist(ChecklistItemModel params) {
    // TODO: implement updateSubtaskChecklist
    throw UnimplementedError();
  }

  Future<SubtaskModel> deleteSubtaskChecklist(SubtaskChecklistIdParams params) {
    // TODO: implement deleteSubtaskChecklist
    throw UnimplementedError();
  }
}
