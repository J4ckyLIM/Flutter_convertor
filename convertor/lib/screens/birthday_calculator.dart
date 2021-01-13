import 'package:flutter/material.dart';

class BirthdayCalculator extends StatefulWidget {
  BirthdayCalculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BirthdayCalculatorState createState() => _BirthdayCalculatorState();
}

class _BirthdayCalculatorState extends State<BirthdayCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
