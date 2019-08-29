import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adventure_type.dart';
import '../widgets/difficulty.dart';

class AddAdventure extends StatefulWidget {
  //final Function addAdventure;
  //AddAdventure(this.addAdventure);

  @override
  _AddAdventureState createState() => _AddAdventureState();
}

class _AddAdventureState extends State<AddAdventure> {
  var _adventureNameController = TextEditingController();
  var _sliderValue = 0.0;
  var _coreValue = 'Adventure';
  var _coreValues = [
    'Authenticity',
    'Achievement',
    'Adventure',
    'Authority',
    'Autonomy',
    'Balance',
    'Beauty',
    'Boldness',
    'Compassion',
    'Challenge',
    'Citizenship',
    'Community',
    'Competency',
    'Contribution',
    'Creativity',
    'Curiosity',
    'Determination',
    'Fairness',
    'Faith',
    'Fame',
    'Friendships',
    'Fun',
    'Growth',
    'Happiness',
    'Honesty',
    'Humor',
    'Influence',
    'Inner Harmony',
    'Justice',
    'Kindness',
    'Knowledge',
    'Leadership',
    'Learning',
    'Love',
    'Loyalty',
    'Meaningful Work',
    'Openness',
    'Optimism',
    'Peace',
    'Pleasure',
    'Poise',
    'Popularity',
    'Recognition',
    'Religion',
    'Reputation',
    'Respect',
    'Responsibility',
    'Security',
    'Self-Respect',
    'Service',
    'Spirituality',
    'Stability',
    'Success',
    'Status',
    'Trustworthiness',
    'Wealth',
    'Wisdom'
  ];

  DateTime _transactionDate;

  void _updateSliderValue(double newSliderValue) {
    _sliderValue = newSliderValue;
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            initialDate: DateTime.now(),
            //Hardcoded - FIX by making dynamic
            lastDate: DateTime(2020))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _transactionDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add A Step'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'The name of your EPIC adventure',
              ),
              controller: _adventureNameController,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Why are you embarking on this journey?'),
              maxLines: 5,
            ),
            Row(
              children: <Widget>[
                Text('Deadline'),
                FlatButton(
                  child: _transactionDate == null
                      ? Text('Pick A Date')
                      : Text('${DateFormat.yMMMd().format(_transactionDate)}'),
                  onPressed: _presentDatePicker,
                ),
                //insert button with datepicker widget
              ],
            ),
            Difficulty(_updateSliderValue),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Core Value'),
                  DropdownButton(
                    value: _coreValue,
                    onChanged: (String newValue) {
                      setState(() {
                        _coreValue = newValue;
                      });
                    },
                    items: _coreValues.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  //Dropdown
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
                width: 300,
                margin: EdgeInsets.only(bottom: 20),
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'NEXT',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdventureType(),
                        ));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
