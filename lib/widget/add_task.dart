import 'package:flutter/material.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({Key? key, required this.onPressedCallBack}) : super(key: key);

  final void Function() onPressedCallBack;
  static String? taskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Column(
        children: [
          const Text(
            "Add Task",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 35,
            ),
          ),
          TextField(
            onChanged: (value) {
              taskTitle = value;
            },
            autofocus: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
              onPressed: onPressedCallBack,
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
