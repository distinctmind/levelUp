import 'package:flutter/material.dart';
import '../models/quest.dart';

class QuestList extends StatelessWidget {
  final List<Quest> userQuests;
  QuestList(this.userQuests);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userQuests.length,
      itemBuilder: (ctx, index) {
        return SizedBox(
          width: double.infinity,
          height: 90,
          child: Card(
            elevation: 2,
            child: Text('${userQuests[index].name}'),
          ),
        );
      },
    );
  }
}
