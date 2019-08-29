import 'package:flutter/material.dart';
import '../models/lvl_step.dart';

class DayStats extends StatelessWidget {
  
  final List<LevelStep> userSteps;
  DayStats(this.userSteps);

  int get stepsCompleted {
    int stepsCompleted = 0;
    userSteps.forEach((step){
      if (step.completed) stepsCompleted++;
    });
    return stepsCompleted;
  }

  int get totalPoints {
    int totalPoints = 0;
    userSteps.forEach((step){
      if (step.completed) totalPoints += step.points;
    });
    return totalPoints;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //FIX - Need to be dynamic variables
                  Text('Aug 28 2019'),
                  Text('Wednesday')
                ]),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              //color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  //FIX - Also needs to be dynamic text variable
                  Text('$stepsCompleted/${userSteps.length}'),
                  Text('$totalPoints points')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
