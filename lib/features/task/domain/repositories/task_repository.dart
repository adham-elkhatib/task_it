import 'package:dartz/dartz.dart';

import '../../../../core/Services/Error Handling/errors/failure.dart';
import '../../../../core/params/tasks/tasks_params.export.dart';
import '../entities/subtask_entity.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  // --------------------------
  // 1. Basic Task Operations
  // --------------------------

  Future<Either<Failure, TaskEntity>> getTask({required GetTaskParams params});

  Future<Either<Failure, List<TaskEntity>>> getTasksByProjectId({
    required ProjectIdParams params,
  });

  Future<Either<Failure, List<TaskEntity>>> getTasksByUserId({
    required UserIdParams params,
  });

  Future<Either<Failure, TaskEntity>> createTask({
    required CreateTaskParams params,
  });

  Future<Either<Failure, TaskEntity>> updateTask({
    required UpdateTaskParams params,
  });

  Future<Either<Failure, void>> deleteTask({required TaskIdParams params});

  Future<Either<Failure, TaskEntity>> completeTask({
    required TaskIdParams params,
  });

  Future<Either<Failure, TaskEntity>> unCompleteTask({
    required TaskIdParams params,
  });

  // --------------------------
  // 2. Comments & Attachments
  // --------------------------

  Future<Either<Failure, TaskEntity>> addTaskComment({
    required TaskCommentParams params,
  });

  Future<Either<Failure, TaskEntity>> updateTaskComment({
    required TaskCommentParams params,
  });

  Future<Either<Failure, TaskEntity>> deleteTaskComment({
    required TaskCommentIdParams params,
  });

  Future<Either<Failure, TaskEntity>> addTaskAttachment({
    required TaskAttachmentParams params,
  });

  Future<Either<Failure, TaskEntity>> updateTaskAttachment({
    required TaskAttachmentParams params,
  });

  Future<Either<Failure, TaskEntity>> deleteTaskAttachment({
    required TaskAttachmentIdParams params,
  });

  // --------------------------
  // 3. Assignees, Labels, Tags, Reminders
  // --------------------------

  Future<Either<Failure, TaskEntity>> addTaskAssignee({
    required TaskAssigneeParams params,
  });

  Future<Either<Failure, TaskEntity>> removeTaskAssignee({
    required TaskAssigneeParams params,
  });

  Future<Either<Failure, TaskEntity>> addTaskLabel({
    required TaskLabelParams params,
  });

  Future<Either<Failure, TaskEntity>> removeTaskLabel({
    required TaskLabelParams params,
  });

  Future<Either<Failure, TaskEntity>> addTaskTag({
    required TaskTagParams params,
  });

  Future<Either<Failure, TaskEntity>> removeTaskTag({
    required TaskTagParams params,
  });

  Future<Either<Failure, TaskEntity>> addTaskReminder({
    required TaskReminderParams params,
  });

  Future<Either<Failure, TaskEntity>> removeTaskReminder({
    required TaskReminderParams params,
  });

  // --------------------------
  // 4. Checklist & Subtasks
  // --------------------------

  Future<Either<Failure, TaskEntity>> addChecklist({
    required TaskChecklistParams params,
  });

  Future<Either<Failure, TaskEntity>> updateChecklist({
    required TaskChecklistParams params,
  });

  Future<Either<Failure, TaskEntity>> deleteChecklist({
    required TaskChecklistIdParams params,
  });

  Future<Either<Failure, List<SubtaskEntity>>> getSubtasksByTaskId(
    String taskId,
  );

  Future<Either<Failure, SubtaskEntity>> addSubtask({
    required SubtaskParams params,
  });

  Future<Either<Failure, SubtaskEntity>> updateSubtask({
    required SubtaskParams params,
  });

  Future<Either<Failure, void>> deleteSubtask({
    required SubtaskIdParams params,
  });

  // --------------------------
  // 5. Subtask Extended Features
  // --------------------------

  Future<Either<Failure, TaskEntity>> addSubtaskComment({
    required SubtaskCommentParams params,
  });

  Future<Either<Failure, TaskEntity>> updateSubtaskComment({
    required SubtaskCommentParams params,
  });

  Future<Either<Failure, TaskEntity>> deleteSubtaskComment({
    required SubtaskCommentIdParams params,
  });

  Future<Either<Failure, TaskEntity>> addSubtaskAttachment({
    required SubtaskAttachmentParams params,
  });

  Future<Either<Failure, TaskEntity>> updateSubtaskAttachment({
    required SubtaskAttachmentParams params,
  });

  Future<Either<Failure, TaskEntity>> deleteSubtaskAttachment({
    required SubtaskAttachmentIdParams params,
  });

  Future<Either<Failure, TaskEntity>> addSubtaskAssignee({
    required SubtaskAssigneeParams params,
  });

  Future<Either<Failure, TaskEntity>> removeSubtaskAssignee({
    required SubtaskAssigneeParams params,
  });

  Future<Either<Failure, TaskEntity>> addSubtaskLabel({
    required SubtaskLabelParams params,
  });

  Future<Either<Failure, TaskEntity>> removeSubtaskLabel({
    required SubtaskLabelParams params,
  });

  Future<Either<Failure, TaskEntity>> addSubtaskTag({
    required SubtaskTagParams params,
  });

  Future<Either<Failure, TaskEntity>> removeSubtaskTag({
    required SubtaskTagParams params,
  });

  Future<Either<Failure, TaskEntity>> addSubtaskReminder({
    required SubtaskReminderParams params,
  });

  Future<Either<Failure, TaskEntity>> removeSubtaskReminder({
    required SubtaskReminderParams params,
  });

  Future<Either<Failure, TaskEntity>> addSubtaskChecklist({
    required SubtaskChecklistParams params,
  });

  Future<Either<Failure, TaskEntity>> updateSubtaskChecklist({
    required SubtaskChecklistParams params,
  });

  Future<Either<Failure, TaskEntity>> deleteSubtaskChecklist({
    required SubtaskChecklistIdParams params,
  });
}
