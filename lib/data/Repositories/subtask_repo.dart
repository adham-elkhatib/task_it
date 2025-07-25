import 'package:task_it/features/task/data/models/subtask_model.dart';

import '../../../../core/Providers/FB Firestore/fbfirestore_repo.dart';

class SubtaskRepo extends FirestoreRepo<SubtaskModel> {
  SubtaskRepo({required this.taskId}) : super('tasks/$taskId/subtasks');

  final String taskId;

  @override
  SubtaskModel toModel(Map<String, dynamic> item) => SubtaskModel.fromMap(item);

  @override
  Map<String, dynamic> fromModel(SubtaskModel item) => item.toMap();
}
