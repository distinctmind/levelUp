import 'package:flutter/material.dart';
import 'package:level_up/models/goal.dart';

import './widgets/quest_list.dart';
import './models/quest.dart';

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

class AddQuestPage extends StatelessWidget {
  
  final Function addQuest;
  AddQuestPage(this.addQuest);

  final questNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Quest'),
          centerTitle: false,
        ),
        body: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Quest Name'),
              controller: questNameController,
            ),
            RaisedButton(
              child: Text('Create Quest'),
              onPressed: () {
                final quest = Quest(name: questNameController.text, goals: null);
                addQuest(quest);
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}
