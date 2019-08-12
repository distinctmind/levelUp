import 'package:flutter/material.dart';
import '../models/goal.dart';
import '../models/quest.dart';

class AddGoalPage extends StatelessWidget {
  //final Function addQuest;
  //AddGoalPage(this.addQuest);

  final List<Goal> userGoals = [];
  final TextEditingController goalController = TextEditingController();

  // void presentDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     firstDate: DateTime.now(),
  //     initialDate: DateTime.now(),
  //     lastDate: DateTime(2020),
  //   ).then((onValue) {
  //     //do something with picked value
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Your First Goal'),
        centerTitle: false,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              decoration:
                  InputDecoration(labelText: 'The goal. Make it specific.'),
              controller: goalController,
            ),
          ),
          Column(
            children: <Widget>[
              Text('Select Deadline'),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: <Widget>[
                    Text('No Date Chosen'),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 40,
                        width: 40,
                        child: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: (){},
                        ))
                  ],
                ),
              )
            ],
          ),
          Text('Difficulty:'),
          Slider(
            min: 0,
            max: 50,
            value: 0,
            onChanged: (val) {},
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            child: RaisedButton(
              child: Text('ADD GOAL'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
