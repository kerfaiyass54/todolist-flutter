import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_list/provider/TaskModel.dart';
import 'package:to_do_list/widget/ListTasksTodayWidget.dart';
import 'package:to_do_list/model/Task.dart';
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime _selectedDay = DateTime.now();

  DateTime _focusedDay = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  final _taskController = TextEditingController();

  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
        builder: (context, task, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add new task"),
        ),
        body:Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TableCalendar(calendarFormat: CalendarFormat.week,firstDay: DateTime.utc(2010, 1, 1), lastDay: DateTime.utc(2050, 12, 12), focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, datetime, events){
                    return Container(
                      width: 15,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.circular(4.0)
                      ),
                      child: Center(
                        child: Text(task.counTasksByDate(datetime).toString())
                      ),
                    );
                  },
                  dowBuilder: (context, day) {
                    if (day.weekday == DateTime.sunday) {
                      return Center(
                        child: Text(
                          "week",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }

                  },

                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _taskController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter task name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter task description';
                    }
                    return null;
                  },
                ),
              )
            ]
        )
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: (){
            if (_formKey.currentState!.validate()) {
              Task _newTask = Task(_taskController.text,false,_descriptionController.text,_focusedDay);
              task.addTask(_newTask);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task added successfully')),
              );
              Navigator.pushReplacementNamed(context, "listTasks");
            }
          },),
      );}
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _taskController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
