import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?)? toggleCheckboxState;
  final String title;
  final void Function()? longPressCallBack;

  const TaskTile({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.toggleCheckboxState,
    required this.longPressCallBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: toggleCheckboxState,
      ),
    );
  }
}
