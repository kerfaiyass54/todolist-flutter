import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider/TaskModel.dart';
import 'package:to_do_list/widget/ListTasksTodayWidget.dart';
import 'package:to_do_list/widget/ListTasksTomorrowWidget.dart';
import 'package:to_do_list/widget/ListTasksOthersWidget.dart';
class ListTasks extends StatefulWidget {
  const ListTasks({super.key});

  @override
  State<ListTasks> createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  Widget build(BuildContext context) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  bottom: const TabBar(tabs: [
                    Text("Today"),
                    Text("Tomorrrow"),
                    Text("Others"),
                  ]),
                ),
              body: const TabBarView(children: [
                ListTasksTodayWidget(),
                ListTasksTomorrowWidget(),
                ListTasksOthersWidget()



              ],
              ),
                floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  Navigator.pushNamed(context, "addTask");
                }),
            
            
                ),
          );
    }
}
