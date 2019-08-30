import 'package:flutter/material.dart';

import '../models/habit.dart';
import './adventures.dart';

class AdventureList extends StatelessWidget {

  int getDaysLeft(DateTime dateCreated, int streak) {
    var difference = DateTime.now().difference(dateCreated).inDays;
    return streak - difference;
  }

  @override
  Widget build(BuildContext context) {
    final List<Habit> adventureList = InheritedAdventures.of(context).adventureService.habits;
    return adventureList.length == 0
        ? Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text('You\'re not growing rn. Start to add an adventure (goal/habit) you want to achieve to lvl up!', textAlign: TextAlign.center,))
        : ListView.builder(
            itemCount: adventureList.length,
            itemBuilder: (ctx, index) {
              return Container(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${adventureList[index].name}'),
                      Text('+${adventureList[index].difficulty.toStringAsFixed(0)} pts')
                    ],
                  ),
                  subtitle: Text('${getDaysLeft(adventureList[index].dateCreated, adventureList[index].streak)} days left'),
                ),
              );
            },
          );
  }
}
