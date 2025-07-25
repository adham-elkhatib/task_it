import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/subtask_model.dart';
import '../../../models/task_comment_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskCommentsRemoteImpl on BaseTaskRemoteContext {
  Future<SubtaskModel> addSubtaskComment(CommentModel params) {
    // TODO: implement addSubtaskComment
    throw UnimplementedError();
  }

  Future<SubtaskModel> updateSubtaskComment(CommentModel params) {
    // TODO: implement updateSubtaskComment
    throw UnimplementedError();
  }

  Future<SubtaskModel> deleteSubtaskComment(SubtaskCommentIdParams params) {
    // TODO: implement deleteSubtaskComment
    throw UnimplementedError();
  }
}
