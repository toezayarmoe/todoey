import 'package:flutter/widgets.dart';
import 'package:todoey/models/task.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [];

  int get taskCount => tasks.length;
  List<Task> get tasks => _tasks;
  void setTask(List<Task> task) async {
    // ignore: await_only_futures
    _tasks = await task;
    notifyListeners();
  }

  void add(String taskName) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    _tasks.add(Task(taskName: taskName));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(int index) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    _tasks.remove(_tasks[index]);
    // prefs.setString('taskData', Task.encode(_tasks));

    notifyListeners();
  }
}
