import 'package:flutter/material.dart';
import 'package:to_do_list/model/Task.dart';
import 'package:to_do_list/library/globals.dart' as globals;
import 'package:dart_date/dart_date.dart';
class TaskModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final Map<String, List<Task>> _todotasks = {
    globals.today: [Task("PFE", false, "projet de fin d'études", DateTime.now())],
    globals.tomorrow: [Task("PFE", false, "projet de fin d'études", DateTime.now())],
    globals.other: [Task("PFE", false, "projet de fin d'études", DateTime.now())]
  };

  /// An unmodifiable view of the items in the cart.
  Map<String, List<Task>> get todotasks => _todotasks;

  void markAsDone(String key,int i){
    _todotasks[key]![i]?.finished=true;
    notifyListeners();
  }


int counTasksByDate(DateTime _dateTime) {
  String _key = guessDay(_dateTime);
  if(_todotasks.containsKey(_key)){
  return _todotasks[_key]!.where((task) => task.dateOfFinish.month == _dateTime.month && task.dateOfFinish.day == _dateTime.day &&
      task.dateOfFinish.year == _dateTime.year
  ).length;

}
  return 0;
  }


  void addTask(Task task){
    String _key = guessDay(task.dateOfFinish);
    if(_todotasks.containsKey(_key)){
      _todotasks[_key]!.add(task);
      notifyListeners();
    }


  }

  String guessDay(DateTime date){
    if(date.isToday){
      return globals.today;
    }
    else if(date.isTomorrow){
      return globals.tomorrow;

    }
    else{
      return globals.other;
    }

  }


}