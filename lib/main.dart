import 'package:flutter/material.dart';

import './models/goal.dart';
import './models/quest.dart';
import './widgets/task_list.dart';
import './widgets/level.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _userTasks = ['Do groceries', 'Go shopping'];

  void _addUserQuest(String task) {
    setState(() {
      _userTasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(_userTasks),
      //initialRoute: '/',
      // routes: {
      //   '/AddQuestPage': (context) => AddQuestPage(_addUserQuest),
      //   '/AddGoalPage': (context) => AddGoalPage(),
      // }
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> userTasks;
  MyHomePage(this.userTasks);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: PreferredSize(
    //     preferredSize: Size.fromHeight(100),
    //     child: Level(),
    //   ),
    //   body: Container(
    //     child: QuestList(userQuests),
    //   ),
    // );
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
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
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
                              children: <Widget>[Text('0/0'), Text('0 points')],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: TaskList(userTasks))
                ],
              ),
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
