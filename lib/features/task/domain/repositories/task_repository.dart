import 'package:dartz/dartz.dart';
import 'package:task_it/features/task/domain/entities/label_entity.dart';
import 'package:task_it/features/task/domain/entities/reminder_entity.dart';
import 'package:task_it/features/task/domain/entities/tag_entity.dart';

import '../../../../core/Services/Error Handling/errors/failure.dart';
import '../../../../core/params/tasks/tasks_params.export.dart';
import '../entities/checklist_item_entity.dart';
import '../entities/comment_entity.dart';
import '../entities/subtask_entity.dart';
import '../entities/task_attachment_entity.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  // ===== TASKS: CRUD =====
  Future<Either<Failure, TaskEntity>> getTask(GetTaskParams params);

  Future<Either<Failure, List<TaskEntity>>> getTasksByProjectId(
    ProjectIdParams params,
  );

  Future<Either<Failure, List<TaskEntity>>> getTasksByUserId(
    UserIdParams params,
  );

  Future<Either<Failure, TaskEntity>> createTask(CreateTaskParams params);

  Future<Either<Failure, TaskEntity>> updateTask(UpdateTaskParams params);

  Future<Either<Failure, void>> deleteTask(TaskIdParams params);

  Future<Either<Failure, TaskEntity>> completeTask(TaskIdParams params);

  Future<Either<Failure, TaskEntity>> unCompleteTask(TaskIdParams params);

  // ===== TASKS: Comments =====
  Future<Either<Failure, CommentEntity>> addTaskComment(
    TaskCommentParams params,
  );

  Future<Either<Failure, CommentEntity>> updateTaskComment(
    TaskCommentParams params,
  );

  Future<Either<Failure, void>> deleteTaskComment(TaskCommentIdParams params);

  // ===== TASKS: Attachments =====
  Future<Either<Failure, AttachmentEntity>> addTaskAttachment(
    TaskAttachmentParams params,
  );

  Future<Either<Failure, AttachmentEntity>> updateTaskAttachment(
    TaskAttachmentParams params,
  );

  Future<Either<Failure, void>> deleteTaskAttachment(
    TaskAttachmentIdParams params,
  );

  // ===== TASKS: Assignees =====
  Future<Either<Failure, TaskEntity>> addTaskAssignee(
    TaskAssigneeParams params,
  );

  Future<Either<Failure, TaskEntity>> removeTaskAssignee(
    TaskAssigneeParams params,
  );

  // ===== TASKS: Labels =====

  Future<Either<Failure, LabelEntity>> addTaskLabel(TaskLabelParams params);

  Future<Either<Failure, void>> removeTaskLabel(TaskLabelParams params);

  // ===== TASKS: Tags =====

  Future<Either<Failure, TagEntity>> addTaskTag(TaskTagParams params);

  Future<Either<Failure, void>> removeTaskTag(TaskTagParams params);

  // ===== TASKS: Reminders =====

  Future<Either<Failure, ReminderEntity>> addTaskReminder(
    TaskReminderParams params,
  );

  Future<Either<Failure, void>> removeTaskReminder(TaskReminderParams params);

  // ===== TASKS: Checklist =====
  Future<Either<Failure, ChecklistItemEntity>> addChecklistItem(
    TaskChecklistParams params,
  );

  Future<Either<Failure, ChecklistItemEntity>> updateChecklistItem(
    TaskChecklistParams params,
  );

  Future<Either<Failure, void>> deleteChecklistItem(
    TaskChecklistIdParams params,
  );

  // ===== SUBTASKS: CRUD =====
  Future<Either<Failure, List<SubtaskEntity>>> getSubtasksByTaskId(
    SubtaskIdParams params,
  );

  Future<Either<Failure, SubtaskEntity>> addSubtask(SubtaskParams params);

  Future<Either<Failure, SubtaskEntity>> updateSubtask(SubtaskParams params);

  Future<Either<Failure, void>> deleteSubtask(SubtaskIdParams params);

  // ===== SUBTASKS: Comments =====
  Future<Either<Failure, CommentEntity>> addSubtaskComment(
    SubtaskCommentParams params,
  );

  Future<Either<Failure, CommentEntity>> updateSubtaskComment(
    SubtaskCommentParams params,
  );

  Future<Either<Failure, void>> deleteSubtaskComment(
    SubtaskCommentIdParams params,
  );

  // ===== SUBTASKS: Attachments =====
  Future<Either<Failure, SubtaskEntity>> addSubtaskAttachment(
    SubtaskAttachmentParams params,
  );

  Future<Either<Failure, AttachmentEntity>> updateSubtaskAttachment(
    SubtaskAttachmentParams params,
  );

  Future<Either<Failure, void>> deleteSubtaskAttachment(
    SubtaskAttachmentIdParams params,
  );

  // ===== SUBTASKS: Assignees =====
  Future<Either<Failure, SubtaskEntity>> addSubtaskAssignee(
    SubtaskAssigneeParams params,
  );

  Future<Either<Failure, void>> removeSubtaskAssignee(
    SubtaskAssigneeParams params,
  );

  // ===== SUBTASKS: Labels =====

  Future<Either<Failure, LabelEntity>> addSubtaskLabel(
    SubtaskLabelParams params,
  );

  Future<Either<Failure, void>> removeSubtaskLabel(SubtaskLabelParams params);

  // ===== SUBTASKS: Tags =====

  Future<Either<Failure, TagEntity>> addSubtaskTag(SubtaskTagParams params);

  Future<Either<Failure, void>> removeSubtaskTag(SubtaskTagParams params);

  // ===== SUBTASKS: Reminders =====

  Future<Either<Failure, ReminderEntity>> addSubtaskReminder(
    SubtaskReminderParams params,
  );

  Future<Either<Failure, void>> removeSubtaskReminder(
    SubtaskReminderParams params,
  );

  // ===== SUBTASKS: Checklist =====
  Future<Either<Failure, ChecklistItemEntity>> addSubtaskChecklist(
    SubtaskChecklistParams params,
  );

  Future<Either<Failure, ChecklistItemEntity>> updateSubtaskChecklist(
    SubtaskChecklistParams params,
  );

  Future<Either<Failure, void>> deleteSubtaskChecklist(
    SubtaskChecklistIdParams params,
  );
}
