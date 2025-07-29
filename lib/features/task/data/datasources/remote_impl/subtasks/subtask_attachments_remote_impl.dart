import '../../../../../../core/params/tasks/subtask_params/attachment/subtask_attachment_id_params.dart';
import '../../../models/task_attachment_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskAttachmentsRemoteImpl on BaseTaskRemoteContext {
  Future<AttachmentModel> addSubtaskAttachment(AttachmentModel model) {
    // TODO: implement addSubtaskAssignee
    throw UnimplementedError();
  }

  Future<AttachmentModel> updateSubtaskAttachment(AttachmentModel model) {
    // TODO: implement removeSubtaskAssignee
    throw UnimplementedError();
  }

  Future<void> deleteSubtaskAttachment(SubtaskAttachmentIdParams params) {
    // TODO: implement removeSubtaskAssignee
    throw UnimplementedError();
  }
}
