import 'package:flutter/material.dart';

import '../widgets/difficulty.dart';
import '../models/lvl_step.dart';

class AddStep extends StatefulWidget {
  final Function addStep;
  AddStep(this.addStep);

  @override
  _AddStepState createState() => _AddStepState();
}

class _AddStepState extends State<AddStep> {
  
  var _sliderValue = 0.0;
  void _updateSliderValue(double newSliderValue) {
      _sliderValue = newSliderValue;
  }

  var stepController = TextEditingController();
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
                hintText: 'What step are you taking?',
              ),
              controller: stepController,
            ),
            Difficulty(_updateSliderValue),
            Expanded(child: SizedBox()),
            Container(
              width: 300,
              margin: EdgeInsets.only(bottom: 20),
              child: RaisedButton(
                color: Colors.green,
                child: Text(
                  'Add Step',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  LevelStep step = LevelStep(
                      step: stepController.text,
                      points: _sliderValue.toInt(),
                      completed: false);
                  widget.addStep(step);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
