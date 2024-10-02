import 'package:flutter/material.dart';
import 'package:to_do_list/model/Task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider/TaskModel.dart';
import 'package:to_do_list/library/globals.dart' as globals;
class ListTasksTomorrowWidget extends StatelessWidget {
  const ListTasksTomorrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
        builder: (context, task, child) {
          return ListView.builder(itemCount: task.todotasks[globals.tomorrow]!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF5EDCDF),
                    border: Border.all(color: Color(0xFF1F31BA)),
                  ),
                  child: CheckboxListTile(
                    title: Text(task.todotasks[globals.tomorrow]![index].name),
                    subtitle: Text(
                        task.todotasks[globals.tomorrow]![index].dateOfFinish.toString()),
                    onChanged: (bool? value) {
                      task.markAsDone(globals.tomorrow,index);
                    },
                    value: task.todotasks[globals.tomorrow]![index].finished,

                  ),),);
            },);
        });
  }

}