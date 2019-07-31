import 'package:flutter/material.dart';
import './quest_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MyHomePage(), 
    initialRoute: '/',
    routes: {
      '/AddQuestPage': (context) => AddQuestPage(),
    });
  }
}

class MyHomePage extends StatelessWidget {

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
        child: QuestList(),
      ),
    );
  }
}

class AddQuestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Quest'),
        centerTitle: false,
      ),
      body: Container(
        child: Text('Add Quest Page'),
      ),
    );
  }
}
