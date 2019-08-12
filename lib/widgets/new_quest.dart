import 'package:flutter/material.dart';

import './new_goal.dart';
import '../models/goal.dart';
import '../models/quest.dart';

class AddQuestPage extends StatelessWidget {
  final Function addQuest;
  AddQuestPage(this.addQuest);

  final List<Goal> userGoals = [];

  final questNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Quest'),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              //Quest Name Input
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Quest Name'),
                  controller: questNameController,
                ),
              ),

              //Level UP Section

              Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft, child: Text('Level Up')),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('0 points to Level 1')),
                ],
              ),
              SizedBox(height: 20,),
              //Add Adventures (goals) section
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Adventures:',
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: userGoals.length,
                    itemBuilder: (ctx, index) {
                      return Text(userGoals[index].action);
                    },
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5,
                      child: Text('Add an Adventure'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/AddGoalPage');
                      },
                    ),
                  ),
                ],
              ),

              //Empty space and Create Quest Button
              Expanded(
                child: SizedBox(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Create Quest'),
                  onPressed: () {
                    final quest =
                        Quest(name: questNameController.text, goals: null);
                    addQuest(quest);
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
