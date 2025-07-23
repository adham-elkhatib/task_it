import 'package:task_it/features/task/data/models/task_model.dart';

import '../../core/Providers/FB Firestore/fbfirestore_repo.dart';

class TaskRepo extends FirestoreRepo<TaskModel> {
  TaskRepo() : super('Tasks');

  @override
  TaskModel toModel(Map<String, dynamic> item) => TaskModel.fromMap(item);

  @override
  Map<String, dynamic> fromModel(TaskModel item) => item.toMap();
}
