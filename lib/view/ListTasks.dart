import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider/TaskModel.dart';

class ListTasks extends StatefulWidget {
  const ListTasks({super.key});

  @override
  State<ListTasks> createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
        builder: (context, task, child) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Welcome ! you have " + task.todotasks.length.toString() + " tasks")
                ,
              ),
            body: ListView.builder(itemCount:task.todotasks.length ,itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(task.todotasks[index].name)
              );

            })


    );
    });
}
}