import 'package:task_it/features/task/data/datasources/remote_impl/tasks/task_crud_remote_impl.dart';

import '../../../../../core/params/tasks/tasks_params.export.dart';
import '../../../domain/entities/subtask_entity.dart';
import '../../models/task_model.dart';
import '../base_task_remote_context.dart';

abstract class TaskRemoteDataSource {
  // ===== TASKS ===== //

  // CRUD
  Future<TaskModel> createTask(CreateTaskParams params);

  Future<TaskModel> updateTask(UpdateTaskParams params);

  Future<void> deleteTask(TaskIdParams params);

  Future<TaskModel> getTask(GetTaskParams params);

  Future<List<TaskModel>> getTasksByProjectId(ProjectIdParams params);

  Future<List<TaskModel>> getTasksByUserId(UserIdParams params);

  Future<TaskModel> completeTask(TaskIdParams params);

  Future<TaskModel> unCompleteTask(TaskIdParams params);

  // Assignees
  Future<TaskModel> addTaskAssignee(TaskAssigneeParams params);

  Future<TaskModel> removeTaskAssignee(TaskAssigneeParams params);

  // Tags
  Future<TaskModel> addTaskTag(TaskTagParams params);

  Future<TaskModel> removeTaskTag(TaskTagParams params);

  // Comments
  Future<TaskModel> addTaskComment(TaskCommentParams params);

  Future<TaskModel> deleteTaskComment(TaskCommentIdParams params);

  Future<TaskModel> updateTaskComment(TaskCommentParams params);

  // Attachments
  Future<TaskModel> addTaskAttachment(TaskAttachmentParams params);

  Future<TaskModel> updateTaskAttachment(TaskAttachmentParams params);

  Future<TaskModel> deleteTaskAttachment(TaskAttachmentIdParams params);

  // Reminders
  Future<TaskModel> addTaskReminder(TaskReminderParams params);

  Future<TaskModel> removeTaskReminder(TaskReminderParams params);

  // Labels
  Future<TaskModel> addTaskLabel(TaskLabelParams params);

  Future<TaskModel> removeTaskLabel(TaskLabelParams params);

  // Checklist
  Future<TaskModel> addChecklist(TaskChecklistParams params);

  Future<TaskModel> updateChecklist(TaskChecklistParams params);

  Future<TaskModel> deleteChecklist(TaskChecklistIdParams params);

  // ===== SUBTASKS ===== //
  // CRUD
  Future<List<SubtaskEntity>> getSubtasks(String taskId);

  Future<SubtaskEntity> addSubtask(SubtaskParams params);

  Future<SubtaskEntity> updateSubtask(SubtaskParams params);

  Future<void> deleteSubtask(SubtaskIdParams params);

  // Assignees
  Future<TaskModel> addSubtaskAssignee(SubtaskAssigneeParams params);

  Future<TaskModel> removeSubtaskAssignee(SubtaskAssigneeParams params);

  // Tags
  Future<TaskModel> addSubtaskTag(SubtaskTagParams params);

  Future<TaskModel> removeSubtaskTag(SubtaskTagParams params);

  // Labels
  Future<TaskModel> addSubtaskLabel(SubtaskLabelParams params);

  Future<TaskModel> removeSubtaskLabel(SubtaskLabelParams params);

  // Comments
  Future<TaskModel> addSubtaskComment(SubtaskCommentParams params);

  Future<TaskModel> updateSubtaskComment(SubtaskCommentParams params);

  Future<TaskModel> deleteSubtaskComment(SubtaskCommentIdParams params);

  // Attachments
  Future<TaskModel> addSubtaskAttachment(SubtaskAttachmentParams params);

  Future<TaskModel> updateSubtaskAttachment(SubtaskAttachmentParams params);

  Future<TaskModel> deleteSubtaskAttachment(SubtaskAttachmentIdParams params);

  // Reminders
  Future<TaskModel> addSubtaskReminder(SubtaskReminderParams params);

  Future<TaskModel> removeSubtaskReminder(SubtaskReminderParams params);

  // Checklist
  Future<TaskModel> addSubtaskChecklist(SubtaskChecklistParams params);

  Future<TaskModel> updateSubtaskChecklist(SubtaskChecklistParams params);

  Future<TaskModel> deleteSubtaskChecklist(SubtaskChecklistIdParams params);
}

class TaskRemoteDataSourceImpl extends BaseTaskRemoteContext
    with
        // ===== Tasks =====
        TaskCrudRemoteImpl // TaskAssigneesRemoteImpl,
        // TaskAttachmentsRemoteImpl,
        // TaskChecklistRemoteImpl,
        // TaskCommentsRemoteImpl,
        // TaskLabelsRemoteImpl,
        // TaskRemindersRemoteImpl,
        // TaskTagsRemoteImpl,
        // ===== Subtasks =====
        // SubtaskCrudRemoteImpl,
        // SubtaskAssigneesRemoteImpl,
        // SubtaskAttachmentsRemoteImpl,
        // SubtaskChecklistRemoteImpl,
        // SubtaskCommentsRemoteImpl,
        // SubtaskLabelsRemoteImpl,
        // SubtaskRemindersRemoteImpl,
        // SubtaskTagsRemoteImpl
        implements
        TaskRemoteDataSource {}
