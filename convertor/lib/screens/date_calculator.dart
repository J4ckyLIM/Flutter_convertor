import 'package:flutter/material.dart';

class DateCalculator extends StatefulWidget {
  DateCalculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DateCalculatorState createState() => _DateCalculatorState();
}

class _DateCalculatorState extends State<DateCalculator> {
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
