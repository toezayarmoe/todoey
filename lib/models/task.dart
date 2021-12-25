import 'dart:convert';

class Task {
  final String taskName;
  bool isChecked;

  Task({required this.taskName, this.isChecked = false});
  void toggleDone() {
    isChecked = !isChecked;
  }

  factory Task.fromJson(Map<String, dynamic> jsonData) {
    return Task(
      taskName: jsonData['taskName'],
      isChecked: jsonData['isChecked'],
    );
  }
  static Map<String, dynamic> toMap(Task task) => {
        'taskName': task.taskName,
        'isChecked': task.isChecked,
      };
  static String encode(List<Task> task) => json.encode(
      task.map<Map<String, dynamic>>((task) => Task.toMap(task)).toList());
  static List<Task> decode(String task) => (json.decode(task) as List<dynamic>)
      .map<Task>((item) => Task.fromJson(item))
      .toList();
}
