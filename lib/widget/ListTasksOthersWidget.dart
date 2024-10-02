import 'package:flutter/material.dart';
import 'package:to_do_list/model/Task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider/TaskModel.dart';
import 'package:to_do_list/library/globals.dart' as globals;
class ListTasksOthersWidget extends StatelessWidget {
  const ListTasksOthersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
        builder: (context, task, child) {
          return ListView.builder(itemCount: task.todotasks[globals.other]!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF5EDCDF),
                    border: Border.all(color: Color(0xFF1F31BA)),
                  ),
                  child: CheckboxListTile(
                    title: Text(task.todotasks[globals.other]![index].name),
                    subtitle: Text(
                        task.todotasks[globals.other]![index].dateOfFinish.toString()),
                    onChanged: (bool? value) {
                      task.markAsDone(globals.other,index);
                    },
                    value: task.todotasks[globals.other]![index].finished,

                  ),),);
            },);
        });
  }

}