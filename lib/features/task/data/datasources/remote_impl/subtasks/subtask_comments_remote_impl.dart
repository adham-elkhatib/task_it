import '../../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../models/task_comment_model.dart';
import '../../base_task_remote_context.dart';

mixin SubtaskCommentsRemoteImpl on BaseTaskRemoteContext {
  Future<CommentModel> addSubtaskComment(CommentModel model) {
    // TODO: implement addSubtaskComment
    throw UnimplementedError();
  }

  Future<CommentModel> updateSubtaskComment(CommentModel model) {
    // TODO: implement updateSubtaskComment
    throw UnimplementedError();
  }

  Future<void> deleteSubtaskComment(SubtaskCommentIdParams params) {
    // TODO: implement deleteSubtaskComment
    throw UnimplementedError();
  }
}
