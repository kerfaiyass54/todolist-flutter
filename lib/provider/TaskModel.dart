import 'package:flutter/material.dart';
import 'package:to_do_list/model/Task.dart';

class TaskModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Task> _todotasks = [];

  /// An unmodifiable view of the items in the cart.
  List<Task> get todotasks => _todotasks;


}