import 'package:learvo/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskServices {
final Box<Task>taskBox=Hive.box<Task>('tasks');
Future<void>addTask(Task task)async{
  await taskBox.add(task);
}
Future<void>toggleTask(Task task)async{
  task.isCompleted =!task.isCompleted;
  await task.save();
  
}
int getCompletedTasks(){
  int completedTasks = 0;
  for(var task in taskBox.values){
    if(task.isCompleted){
    completedTasks++;
  }
  }
  return completedTasks;
}
int getTotalTasks(){
  return taskBox.length;
}
double getProgress(){
  if(taskBox.isEmpty){
    return 0.0;
  }
  return getCompletedTasks()/ getTotalTasks();
}
}
