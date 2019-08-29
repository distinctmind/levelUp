import 'package:flutter/material.dart';

class Difficulty extends StatefulWidget {

  final Function updateSliderValue;
  Difficulty(this.updateSliderValue);

  @override
  _DifficultyState createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Difficulty'),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '${_sliderValue.toStringAsFixed(0)} points',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 100,
                    value: _sliderValue,
                    activeColor: Colors.green,
                    inactiveColor: Colors.lightGreen,
                    onChanged: (val) {
                      setState(() {
                        _sliderValue = val;
                      });
                      widget.updateSliderValue(val);
                    },
                  ),
                ),
                Text('Easy'),
              ],
            )
          ],
        ));
  }
}
