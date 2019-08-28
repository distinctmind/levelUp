import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  
  final List<String> userTasks;
  TaskList(this.userTasks);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userTasks.length,
      itemBuilder: (ctx, index) {
        return SizedBox(
          width: double.infinity,
          height: 40,
          child: Card(
            elevation: 2,
            child: Text('${userTasks[index]}'),
          ),
        );
      },
    );
  }
}
