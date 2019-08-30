import 'package:flutter/material.dart';
import 'package:level_up/models/habit.dart';
import '../models/lvl_step.dart';
import 'adventures.dart';

class TaskList extends StatelessWidget {
  final Function updateStep;
  final List<LevelStep> userSteps;
  TaskList(this.userSteps, this.updateStep);

  @override
  Widget build(BuildContext context) {
    final List<Habit> adventureList =
        InheritedAdventures.of(context).adventureService.habits;

    return userSteps.length == 0 && adventureList.length == 0
        ? Container(
            alignment: Alignment.center,
            child: Text(
              'You\'re chilling pretty hard, wanna take a step towards excellence?',
              textAlign: TextAlign.center,
            ))
        : Column(
            children: <Widget>[
              Expanded(
                              child: ListView.builder(
                  itemCount: adventureList.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          child: FlatButton(
                            child: userSteps[index].completed
                                ? Image.asset('assets/images/checkBoxFILLED.png')
                                : Image.asset(
                                    'assets/images/checkBoxOUTLINE.png'),
                            onPressed: () {
                              updateStep(index);
                            },
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${adventureList[index].name}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                                '${adventureList[index].difficulty.toStringAsFixed(0)} pts'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                              child: ListView.builder(
                  itemCount: userSteps.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          child: FlatButton(
                            child: userSteps[index].completed
                                ? Image.asset('assets/images/checkBoxFILLED.png')
                                : Image.asset(
                                    'assets/images/checkBoxOUTLINE.png'),
                            onPressed: () {
                              updateStep(index);
                            },
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${userSteps[index].step}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text('${userSteps[index].points} Pts'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
