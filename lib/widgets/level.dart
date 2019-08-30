import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/habit.dart';
import 'adventures.dart';

class Level extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final List<Habit> adventureList = InheritedAdventures.of(context).adventureService.habits;

    int totalPoints() {
      int totalPoints = 0;
      adventureList.forEach((habit){
        totalPoints += habit.difficulty.toInt();
      });
      return totalPoints;
    }

    return Container(
      //height: 100,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //First ITEM
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'J',
                style: TextStyle(fontSize: 30),
              )),

          //Contains the MEAT (progress bar with level and points to go)
          Container(
            margin: EdgeInsets.only(left: 25, top: 30),
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LinearPercentIndicator(
                  width: 300.0,
                  lineHeight: 14.0,
                  percent: 0,
                  backgroundColor: Colors.white,
                  progressColor: Colors.green,
                  center: Text(
                    "0%",
                    style: new TextStyle(fontSize: 12.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Level 0'),
                    //Spacer(),
                    Text('${totalPoints()} points to go'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
