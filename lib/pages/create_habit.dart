import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../widgets/adventures.dart';
import '../widgets/difficulty.dart';
import '../models/habit.dart';

class CreateHabit extends StatefulWidget {
  @override
  _CreateHabitState createState() => _CreateHabitState();
}

class _CreateHabitState extends State<CreateHabit> {
  var nameController = TextEditingController();
  var skillController = TextEditingController();
  var habitDifficulty = 0.0;
  var habitStreak = 0;

  void updateSliderValue(val) {
    habitDifficulty = val;
  }

  void presentStreakDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return NumberPickerDialog.integer(
            initialIntegerValue: 1,
            minValue: 1,
            maxValue: 90,
          );
        }).then((onValue) {
      setState(() {
        habitStreak = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HABIT'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Name of habit'),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Skill that is used'),
              controller: skillController,
            ),
            Difficulty(updateSliderValue),
            Row(
              children: <Widget>[
                Text('Streak'),
                FlatButton(
                  child: Text('$habitStreak'),
                  onPressed: () {
                    presentStreakDialog(context);
                  },
                ),
              ],
            ),
            Container(
                width: 300,
                margin: EdgeInsets.only(bottom: 20),
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'CREATE',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Habit habit = Habit(
                        dateCreated: DateTime.now(),
                        name: nameController.text,
                        skill: skillController.text,
                        difficulty: habitDifficulty,
                        streak: habitStreak);
                    InheritedAdventures.of(context)
                        .adventureService
                        .habits
                        .forEach((habit) {
                      print(habit);
                    });
                    InheritedAdventures.of(context)
                        .adventureService
                        .addAdventure(habit);
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
