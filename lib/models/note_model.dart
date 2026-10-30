import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId : 2)
class Note extends HiveObject{

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String subject;

    @HiveField(2)
  final String content;

  @HiveField(3)
  final String date;

  Note({
    required this.title,
    required this.subject,
    required this.content,
    required this.date,
  });
}