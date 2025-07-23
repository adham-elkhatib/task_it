import 'package:task_it/features/task/data/models/task_model.dart';

import '../../../../../core/Services/Error Handling/exports.error_handling.dart';
import '../../../../core/Providers/FB Firestore/fbfirestore_repo.dart';

abstract class BaseTaskRemoteContext {
  late final FirestoreRepo<TaskModel> firestoreRepo;

  Future<T> executeRemoteCall<T>(
    Future<T> Function() request, {
    String? location,
  }) async {
    try {
      final response = await request();

      return response;
    } catch (e, s) {
      throw ErrorHandlingService.handle(e, s, location: location);
    }
  }
}
