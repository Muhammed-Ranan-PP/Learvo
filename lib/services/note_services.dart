import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/models/note_model.dart';

class NoteServices {

final Box<Note>notebox = Hive.box<Note>("notes");

Future<void>addNote(Note note)async{
  await notebox.add(note);
}
List<Note>getNotes(){
  return notebox.values.toList();
}
Future<void>updateNote(int index,Note note)async{
  await notebox.putAt(index,note);
}
Future<void>deleteNote(int index)async{
  await notebox.deleteAt(index);
}
}