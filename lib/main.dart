import 'package:flutter/material.dart';

import './models/lvl_step.dart';
import './widgets/task_list.dart';
import './widgets/day_stats.dart';
import './widgets/level.dart';
import './widgets/adventure_list.dart';

import './pages/add_step.dart';
import './pages/add_adventure.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<LevelStep> _userSteps = [];
  final List<String> _adventureList = [];

  void _updateStep(int index) {
    setState(() {
      _userSteps[index].completed = !_userSteps[index].completed;
    });
  }

  void _addStep(LevelStep step) {
    setState(() {
      _userSteps.add(step);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(title: Level()),
          bottom: PreferredSize(
            preferredSize: Size.square(60),
            child: TabBar(
              tabs: <Widget>[Text('TODAY'), Text('QUESTS')],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  //Contains the stats for today
                  DayStats(_userSteps),

                  //This contains the list of tasks that need to be done today.
                  Expanded(child: TaskList(_userSteps, _updateStep)),

                  Container(
                    width: 300,
                    margin: EdgeInsets.only(bottom: 40),
                    child: RaisedButton(
                      child: Text('Add A Step'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddStep(_addStep),
                              fullscreenDialog: true,
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),

            //Second VIEW (QUESTS)
            Container(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('ADVENTURES', textAlign: TextAlign.start)),
                  Expanded(child: AdventureList(_adventureList)),
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(bottom: 40),
                    child: RaisedButton(
                      child: Text('Add Adventure'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddAdventure(),
                              fullscreenDialog: true,
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
