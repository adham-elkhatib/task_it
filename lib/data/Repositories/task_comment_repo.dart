import 'package:task_it/features/task/data/models/task_comment_model.dart';

import '../../../../core/Providers/FB Firestore/fbfirestore_repo.dart';

class TaskCommentRepo extends FirestoreRepo<CommentModel> {
  TaskCommentRepo({required this.taskId}) : super('tasks/$taskId/comments');

  final String taskId;

  @override
  CommentModel toModel(Map<String, dynamic> item) => CommentModel.fromMap(item);

  @override
  Map<String, dynamic> fromModel(CommentModel item) => item.toMap();
}
