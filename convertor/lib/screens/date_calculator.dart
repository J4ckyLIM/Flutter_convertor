import 'package:convertor/models/birthday.dart';
import 'package:convertor/models/date_calculator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateCalculator extends StatefulWidget {
  DateCalculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DateCalculatorState createState() => _DateCalculatorState();
}

class _DateCalculatorState extends State<DateCalculator> {
  DateCalcul mainDate = DateCalcul(DateTime(1966, 6, 6));
  DateCalcul dateToCompareTo = DateCalcul(DateTime.now());
  AllDateInfo result = AllDateInfo(1, 1, 1);
  bool hasPressed = false;

  Future<void> _selectMainDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != DateTime.now())
      setState(() {
        mainDate.date = picked;
        hasPressed = false;
      });
  }

  Future<void> _selectSecondDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != DateTime.now())
      setState(() {
        dateToCompareTo.date = picked;
        hasPressed = false;
      });
  }

  void _compareDate() {
    setState(() {
      hasPressed = true;
      Map<String, int> res =
          mainDate.calculDateDifference(dateToCompareTo.date);
      result.days = res['days'];
      result.months = res['months'];
      result.years = res['years'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.lock_clock,
                    size: 150,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () => _selectMainDate(context),
                    child: Text(
                        '${DateFormat('yyyy-MM-dd').format(mainDate.date)}'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(20), child: Text(' To compare to ')),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () => _selectSecondDate(context),
                    child: Text(
                        '${DateFormat('yyyy-MM-dd').format(dateToCompareTo.date)}'),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () => _compareDate(),
                    child: Text('Calculate difference'),
                  ),
                )
              ],
            ),
            Visibility(
                visible: hasPressed == true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${result.years} year(s), ${result.months} month(s) and ${result.days} day(s) separate these 2 dates.'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
