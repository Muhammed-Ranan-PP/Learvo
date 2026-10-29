import 'package:learvo/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskServices {
final Box<Task>taskBox=Hive.box<Task>('tasks');
Future<void>addTask(Task task)async{
  await taskBox.add(task);
}
}
