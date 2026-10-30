import 'package:flutter/material.dart';
import 'package:learvo/models/task_model.dart';
import 'package:learvo/widgets/task_card.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/services/task_services.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TaskServices taskServices = TaskServices();
  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: Hive.box<Task>("tasks").listenable(),
               builder: (context,box,child){
                if(box.isEmpty){
                  return Padding(padding: EdgeInsets.all(20),
                  child: Text("No tasks added yet"),
                  );
                }
                List <Widget> taskWidgets = [];
                for(var task in box.values){
                  taskWidgets.add(
                    Padding(padding: EdgeInsets.only(bottom: 5),
                    child: TaskCard(
                      title: task.title,
                       time: task.time,
                        icon: Icons.task_alt,
                         iconColor: Color.fromARGB(255, 139, 92, 246),
                          statusColor: task.isCompleted
                          ?Color.fromARGB(255, 34, 197, 94)
                          :Color.fromARGB(255, 203, 213, 225),
                          isCompleted: task.isCompleted,
                          onTap: () {
                            taskServices.toggleTask(task);
                          },
                          ),
                    )
                  );
                }
                return Column(
                  children: 
                    taskWidgets,
                  
                );
               }
               );
  }
}