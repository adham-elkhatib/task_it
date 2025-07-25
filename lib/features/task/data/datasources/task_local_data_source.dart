import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Services/Error Handling/errors/exceptions.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<void> cacheTask(TaskModel taskToCache);

  Future<void> deleteTask(String taskToRemove);

  Future<void> removeSubtask(String subtaskToRemove);

  Future<TaskModel> getLastTask();
}

const cachedTask = 'CACHED_TASK';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheTask(TaskModel taskToCache) async {
    final jsonString = json.encode(taskToCache.toJson());
    await sharedPreferences.setString(cachedTask, jsonString);
  }

  @override
  Future<TaskModel> getLastTask() {
    final jsonString = sharedPreferences.getString(cachedTask);
    if (jsonString != null) {
      final decodedJson = json.decode(jsonString);
      return Future.value(TaskModel.fromJson(decodedJson));
    } else {
      throw CacheException(message: 'No cached task found.');
    }
  }

  @override
  Future<void> deleteTask(String taskToRemove) async {
    final jsonString = sharedPreferences.getString(cachedTask);
    if (jsonString == null) {
      throw CacheException(message: 'No cached task.');
    }

    final cached = TaskModel.fromJson(json.decode(jsonString));

    if (cached.id == taskToRemove) {
      await sharedPreferences.remove(cachedTask);
    }
  }

  @override
  Future<void> removeSubtask(String subtaskToRemove) async {
    // TODO: implement removeSubtask
    throw UnimplementedError();
    // final jsonString = sharedPreferences.getString(cachedTask);
    // if (jsonString == null) {
    //   throw CacheException(message: 'No cached task.');
    // }
    //
    // final cached = TaskModel.fromJson(json.decode(jsonString));
    //
    // final updatedSubtasks = cached.subtasks
    //     ?.where((s) => s.id != subtaskToRemove)
    //     .toList();
    //
    // final updatedTask = cached.copyWith(subtasks: updatedSubtasks);
    //
    // await sharedPreferences.setString(
    //   cachedTask,
    //   json.encode(updatedTask.toJson()),
    // );
  }
}
