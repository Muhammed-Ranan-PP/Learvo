import 'package:learvo/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskServices {
  final Box<Task> taskBox = Hive.box<Task>('tasks');
  Future<void> addTask(Task task) async {
    await taskBox.add(task);
  }

  Future<void> toggleTask(Task task) async {
    task.isCompleted = !task.isCompleted;
    await task.save();
  }

  int getCompletedTasks() {
    int completedTasks = 0;
    for (var task in taskBox.values) {
      if (task.isCompleted) {
        completedTasks++;
      }
    }
    return completedTasks;
  }

  int getTotalTasks() {
    return taskBox.length;
  }

  double getProgress() {
    if (taskBox.isEmpty) {
      return 0.0;
    }
    return getCompletedTasks() / getTotalTasks();
  }

  // Notes
  List<Task> getTasksWithNotes() {
    return taskBox.values
        .where((task) => task.notes.trim().isNotEmpty)
        .toList();
  }

  List<String> getSubjects() {
    List<String> subjects = [];
    for (var task in taskBox.values) {
      if (!subjects.contains(task.subject)) {
        subjects.add(task.subject);
      }
    }
    return subjects;
  }

  double getSubjectProgress(String subject) {
    int total = 0;
    int completed = 0;
    for (var task in taskBox.values) {
      if (task.subject == subject) {
        total++;

        if (task.isCompleted) {
          completed++;
        }
      }
    }
    if (total == 0) return 0.0;
    return completed / total;
  }

  // week month year
  List<Task> getTasksByPeriod(String period) {
    List<Task> filteredTasks = [];
    DateTime today = DateTime.now();

    for (var task in taskBox.values) {
      DateTime taskDate;

      if (task.date.length == 10 && task.date[2] == "/") {
        taskDate = DateTime(
          int.parse(task.date.substring(6, 10)),
          int.parse(task.date.substring(3, 5)),
          int.parse(task.date.substring(0, 2)),
        );
      } else if (task.date.length == 8 && task.date[2] == "-") {
        taskDate = DateTime(
          2000 + int.parse(task.date.substring(6, 8)),
          int.parse(task.date.substring(3, 5)),
          int.parse(task.date.substring(0, 2)),
        );
      } else {
        continue;
      }

      if (period == "This Week") {
        DateTime startOfWeek = today.subtract(
          Duration(days: today.weekday - 1),
        );

        DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

        if (!taskDate.isBefore(
              DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day),
            ) &&
            !taskDate.isAfter(
              DateTime(endOfWeek.year, endOfWeek.month, endOfWeek.day),
            )) {
          filteredTasks.add(task);
        }
      } else if (period == "This Month") {
        if (taskDate.year == today.year && taskDate.month == today.month) {
          filteredTasks.add(task);
        }
      } else if (period == "This Year") {
        if (taskDate.year == today.year) {
          filteredTasks.add(task);
        }
      }
    }

    return filteredTasks;
  }

  double getSubjectProgressByPeriod(String subject, String period) {
    List<Task> periodTasks = getTasksByPeriod(period);
    int total = 0;
    int completed = 0;
    for (var task in periodTasks) {
      if (task.subject == subject) {
        total++;
        if (task.isCompleted) {
          completed++;
        }
      }
    }
    if (total == 0) return 0.0;
    return completed / total;
  }
}
