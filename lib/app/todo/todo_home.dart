import 'package:flutter/material.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TodoHome'),
      ),
      body: const Center(
        child: Text('TodHome'),
      ),
    );
  }
}
