import '../../../../../../core/params/tasks/subtask_params/subtask_attachment_id_params.dart';
import '../../../models/subtask_model.dart';
import '../../../models/task_attachment_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskAttachmentsRemoteImpl on BaseTaskRemoteContext {
  Future<SubtaskModel> addSubtaskAttachment(AttachmentModel params) {
    // TODO: implement addSubtaskAssignee
    throw UnimplementedError();
  }

  Future<SubtaskModel> updateSubtaskAttachment(AttachmentModel params) {
    // TODO: implement removeSubtaskAssignee
    throw UnimplementedError();
  }

  Future<SubtaskModel> deleteSubtaskAttachment(
    SubtaskAttachmentIdParams params,
  ) {
    // TODO: implement removeSubtaskAssignee
    throw UnimplementedError();
  }
}
