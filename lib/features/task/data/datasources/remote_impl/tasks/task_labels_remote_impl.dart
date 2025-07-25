import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_comment_model.dart';
import '../../../models/task_model.dart';
import '../../base_task_remote_context.dart';

mixin TaskLabelsRemoteImpl on BaseTaskRemoteContext {
  Future<TaskModel> addTaskComment(CommentModel params) {
    // TODO: implement addTaskComment
    throw UnimplementedError();
  }

  Future<TaskModel> updateTaskComment(CommentModel params) {
    // TODO: implement updateTaskComment
    throw UnimplementedError();
  }

  Future<TaskModel> deleteTaskComment(TaskCommentIdParams params) {
    // TODO: implement deleteTaskComment
    throw UnimplementedError();
  }
}
