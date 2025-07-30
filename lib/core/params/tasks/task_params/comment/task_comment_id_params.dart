import '../../base_task_params.dart';

class TaskCommentIdParams extends BaseTaskParams {
  final String commentId;

  const TaskCommentIdParams({
    required super.taskId,
    required super.spaceId,
    required this.commentId,
  });
}
