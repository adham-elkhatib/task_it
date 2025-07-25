import 'package:task_it/features/task/data/models/task_attachment_model.dart';

import '../../../../core/Providers/FB Firestore/fbfirestore_repo.dart';

class TaskAttachmentRepo extends FirestoreRepo<AttachmentModel> {
  TaskAttachmentRepo({required this.taskId})
    : super('tasks/$taskId/attachments');

  final String taskId;

  @override
  AttachmentModel toModel(Map<String, dynamic> item) =>
      AttachmentModel.fromMap(item);

  @override
  Map<String, dynamic> fromModel(AttachmentModel item) => item.toMap();
}
