import 'package:task_it/features/task/data/datasources/remote_impl/remote_mixins.export.dart';
import 'package:task_it/features/task/data/models/subtask_model.dart';

import '../../../../../core/params/tasks/subtask_params/label/subtask_label_id_params.dart';
import '../../../../../core/params/tasks/subtask_params/tag/subtask_tag_id_params.dart';
import '../../../../../core/params/tasks/task_params/label/task_label_id_params.dart';
import '../../../../../core/params/tasks/task_params/tag/task_tag_id_params.dart';
import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../models/checklist_item_model.dart';
import '../../models/label_model.dart';
import '../../models/reminder_model.dart';
import '../../models/tag_model.dart';
import '../../models/task_attachment_model.dart';
import '../../models/task_comment_model.dart';
import '../../models/task_model.dart';
import '../base_task_remote_context.dart';

abstract class TaskRemoteDataSource {
  // ===== TASKS ===== //
  // CRUD
  Future<TaskModel> getTask(GetTaskParams taskId);

  Future<List<TaskModel>> getTasksByProjectId(ProjectIdParams projectId);

  Future<List<TaskModel>> getTasksByUserId(UserIdParams userId);

  Future<TaskModel> createTask(TaskModel task);

  Future<TaskModel> updateTask(TaskModel task);

  Future<void> deleteTask(TaskIdParams taskId);

  Future<TaskModel> completeTask(TaskModel task);

  Future<TaskModel> unCompleteTask(TaskModel task);

  // Assignees
  Future<TaskModel> addTaskAssignee(TaskModel task);

  Future<TaskModel> removeTaskAssignee(TaskModel task);

  // Tags
  Future<TagModel> addTaskTag(TagModel params);

  Future<void> removeTaskTag(TaskTagIdParams params);

  // Comments
  Future<CommentModel> addTaskComment(CommentModel params);

  Future<CommentModel> updateTaskComment(CommentModel params);

  Future<TaskModel> deleteTaskComment(TaskCommentIdParams params);

  // Attachments
  Future<AttachmentModel> addTaskAttachment(AttachmentModel model);

  Future<AttachmentModel> updateTaskAttachment(AttachmentModel model);

  Future<void> deleteTaskAttachment(TaskAttachmentIdParams params);

  // Reminders
  Future<ReminderModel> addTaskReminder(ReminderModel model);

  Future<void> removeTaskReminder(TaskReminderIdParams params);

  // Labels
  Future<LabelModel> addTaskLabel(LabelModel params);

  Future<void> removeTaskLabel(TaskLabelIdParams params);

  // Checklist
  Future<ChecklistItemModel> addChecklistItem(ChecklistItemModel model);

  Future<ChecklistItemModel> updateChecklistItem(ChecklistItemModel model);

  Future<void> deleteChecklistItem(TaskChecklistIdParams params);

  // ===== SUBTASKS ===== //
  // CRUD
  Future<List<SubtaskModel>> getSubtasksByTaskId(SubtaskIdParams taskId);

  Future<SubtaskModel> addSubtask(SubtaskModel params);

  Future<SubtaskModel> updateSubtask(SubtaskModel params);

  Future<void> deleteSubtask(SubtaskIdParams params);

  // Assignees
  Future<SubtaskModel> addSubtaskAssignee(SubtaskModel params);

  Future<SubtaskModel> removeSubtaskAssignee(SubtaskModel params);

  // Tags
  Future<TagModel> addSubtaskTag(TagModel params);

  Future<void> removeSubtaskTag(SubtaskTagIdParams params);

  // Labels
  Future<LabelModel> addSubtaskLabel(LabelModel params);

  Future<void> removeSubtaskLabel(SubtaskLabelIdParams params);

  // Comments
  Future<CommentModel> addSubtaskComment(CommentModel model);

  Future<CommentModel> updateSubtaskComment(CommentModel model);

  Future<void> deleteSubtaskComment(SubtaskCommentIdParams params);

  // Attachments
  Future<AttachmentModel> addSubtaskAttachment(AttachmentModel model);

  Future<AttachmentModel> updateSubtaskAttachment(AttachmentModel model);

  Future<void> deleteSubtaskAttachment(SubtaskAttachmentIdParams params);

  // Reminders
  Future<ReminderModel> addSubtaskReminder(ReminderModel model);

  Future<void> removeSubtaskReminder(SubtaskReminderParams params);

  // Checklist
  Future<ChecklistItemModel> addSubtaskChecklist(ChecklistItemModel model);

  Future<ChecklistItemModel> updateSubtaskChecklist(ChecklistItemModel model);

  Future<void> deleteSubtaskChecklist(SubtaskChecklistIdParams params);
}

class TaskRemoteDataSourceImpl extends BaseTaskRemoteContext
    with
        // ===== Tasks =====
        TaskCrudRemoteImpl,
        TaskAssigneesRemoteImpl,
        TaskAttachmentsRemoteImpl,
        TaskChecklistRemoteImpl,
        TaskCommentsRemoteImpl,
        TaskLabelsRemoteImpl,
        TaskRemindersRemoteImpl,
        TaskTagsRemoteImpl,
        // ===== Subtasks =====
        SubtaskCrudRemoteImpl,
        SubtaskAssigneesRemoteImpl,
        SubtaskAttachmentsRemoteImpl,
        SubtaskChecklistRemoteImpl,
        SubtaskCommentsRemoteImpl,
        SubtaskLabelsRemoteImpl,
        SubtaskRemindersRemoteImpl,
        SubtaskTagsRemoteImpl
    implements TaskRemoteDataSource {}
