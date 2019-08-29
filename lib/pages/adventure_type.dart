import 'package:flutter/material.dart';
import './milestones.dart';

class AdventureType extends StatelessWidget {
  var adventureType = 0;
  @override
  Widget build(BuildContext context) {
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
                        MaterialPageRoute(
                          builder: (context) => adventureType == 0 ? Milestones() : Milestones(),
                        ));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
