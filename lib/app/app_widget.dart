import 'package:flutter/material.dart';
import 'package:front/app/todo/pages/todo_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoPage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
