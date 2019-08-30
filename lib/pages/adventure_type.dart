import 'package:flutter/material.dart';

import '../navigation/fade_navigation.dart';
import './create_habit.dart';

class AdventureType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var adventureType = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Type Of Adventure'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: Colors.green,
              width: 250,
              height: 250,
              child: FlatButton(
                child: Text(
                  'Repeatable Adventure (Habits..)',
                  textAlign: TextAlign.center,
                ),
                onPressed: () => adventureType = 0,
              ),
            ),
            //width: 300,
            Container(
              color: Colors.grey,
              width: 250,
              height: 250,
              child: FlatButton(
                child: Text('Big Adventure with a end goal'),
                onPressed: () => adventureType = 1,
              ),
            ),
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
                        FadeNavRoute(
                          builder: (context) => adventureType == 0 ? CreateHabit() : CreateHabit(),
                        ));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
