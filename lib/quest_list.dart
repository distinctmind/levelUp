import 'package:flutter/material.dart';

class QuestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Text('child1'),
        ),
        Card(
          child: Text('child2'),
        ),
      ],
    );
  }
}
