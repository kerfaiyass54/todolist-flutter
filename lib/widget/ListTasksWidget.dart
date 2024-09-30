import 'package:flutter/material.dart';
import 'package:to_do_list/model/Task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider/TaskModel.dart';
class ListTasksWidget extends StatelessWidget {
  const ListTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
        builder: (context, task, child) {
          return ListView.builder(itemCount: task.todotasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF5EDCDF),
                    border: Border.all(color: Color(0xFF1F31BA)),
                  ),
                  child: CheckboxListTile(
                    title: Text(task.todotasks[index].name),
                    subtitle: Text(
                        task.todotasks[index].dateOfFinish.toString()),
                    onChanged: (bool? value) {
                      task.markAsDone(index);
                    },
                    value: task.todotasks[index].finished,

                  ),),);
            },);
        });
  }

}