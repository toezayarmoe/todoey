import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widget/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.read<SharedPreferences>().getString("taskData") != null) {
      context.read<TaskData>().setTask(Task.decode(
          context.read<SharedPreferences>().getString("taskData")!));
    }

    return ListView(
      children: [
        Consumer<TaskData>(
          builder: (context, taskData, child) => ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) => TaskTile(
              title: taskData.tasks[index].taskName,
              isChecked: taskData.tasks[index].isChecked,
              toggleCheckboxState: (value) {
                taskData.updateTask(taskData.tasks[index]);
                context.read<SharedPreferences>().setString(
                    'taskData', Task.encode(context.read<TaskData>().tasks));
              },
              longPressCallBack: () {
                taskData.removeTask(index);
                context.read<SharedPreferences>().setString(
                    'taskData', Task.encode(context.read<TaskData>().tasks));
              },
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
