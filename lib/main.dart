import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screen/task_screen.dart';

main() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPreferences>(create: (_) => pref),
        ChangeNotifierProvider<TaskData>(create: (_) => TaskData()),
      ],
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    ),
  );
}
