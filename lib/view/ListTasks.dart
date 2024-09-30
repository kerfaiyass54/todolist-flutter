import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider/TaskModel.dart';
import 'package:to_do_list/widget/ListTasksWidget.dart';

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
                    Tab(icon: Icon(Icons.task)),
                    Tab(icon: Icon(Icons.time_to_leave)),
                    Tab(icon: Icon(Icons.text_fields)),
                  ]),
                ),
              body: const TabBarView(children: [
                ListTasksWidget(),
                ListTasksWidget(),
                ListTasksWidget(),
              ],
              )
            
            
                ),
          );
    }
}
