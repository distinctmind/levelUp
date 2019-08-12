import 'package:flutter/material.dart';

import './models/goal.dart';
import './models/quest.dart';
import './widgets/quest_list.dart';
import './widgets/new_quest.dart';
import './widgets/new_goal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Quest> _userQuests = [
    Quest(name: 'Adventure is everywhere', goals: [
      Goal(
          action: 'Go Hiking',
          deadline: DateTime.now(),
          inFocusMode: true,
          points: 20),
      Goal(
        action: 'Go rooftopping for sunrise',
        deadline: DateTime.now(),
        inFocusMode: false,
        points: 35,
      )
    ]),
  ];

  void _addUserQuest(Quest quest) {
    setState(() {
      _userQuests.add(quest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(_userQuests),
        initialRoute: '/',
        routes: {
          '/AddQuestPage': (context) => AddQuestPage(_addUserQuest),
          '/AddGoalPage': (context) => AddGoalPage(),
        });
  }
}

class MyHomePage extends StatelessWidget {
  final List<Quest> userQuests;
  MyHomePage(this.userQuests);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quests'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30,
            onPressed: () => Navigator.pushNamed(context, '/AddQuestPage'),
          ),
        ],
      ),
      body: Container(
        child: QuestList(userQuests),
      ),
    );
  }
}
