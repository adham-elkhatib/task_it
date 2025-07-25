import 'package:task_it/features/task/data/models/checklist_item_model.dart';

import '../../../../core/Providers/FB Firestore/fbfirestore_repo.dart';

class ChecklistItemRepo extends FirestoreRepo<ChecklistItemModel> {
  ChecklistItemRepo({required this.taskId}) : super('tasks/$taskId/checklist');

  final String taskId;

  @override
  ChecklistItemModel toModel(Map<String, dynamic> item) =>
      ChecklistItemModel.fromMap(item);

  @override
  Map<String, dynamic> fromModel(ChecklistItemModel item) => item.toMap();
}
