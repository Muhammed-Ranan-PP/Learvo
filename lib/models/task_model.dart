import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String subject;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final String time;

  @HiveField(4)
  final String priority;

  @HiveField(5)
  final String notes;

  @HiveField(6)
  bool isCompleted;

  Task({
    required this.title,
    required this.subject,
    required this.date,
    required this.time,
    required this.priority,
    required this.notes,
    this.isCompleted = false,
  });
}
