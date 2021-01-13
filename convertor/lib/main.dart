import 'package:convertor/routes.dart';
import 'package:convertor/routing.dart';
import 'package:convertor/widgets/grid_cell.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tools'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MaterialColor backgroundColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        children: <Widget>[
          GridCell(
            title: 'File size convertor',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(context, Routes.FileSizeConvertor);
            },
          ),
          GridCell(
            title: 'Lifetime calculator',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(context, Routes.BirthdayCalculator);
            },
          ),
          GridCell(
            title: 'Price reduction calculator',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(
                  context, Routes.PriceReductionCalculator);
            },
          ),
          GridCell(
            title: 'Date difference calculator',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(
                  context, Routes.DateDifferenceCalculator);
            },
          ),
          GridCell(
            title: 'Distance convertor',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(context, Routes.DistanceConvertor);
            },
          ),
          GridCell(
            title: 'Binary convertor',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(context, Routes.FileSizeConvertor);
            },
          ),
          GridCell(
            title: 'Area convertor',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(context, Routes.AreaConvertor);
            },
          ),
          GridCell(
            title: 'Temperature convertor',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(context, Routes.TemperatureConvertor);
            },
          ),
          GridCell(
            title: 'Roman number convertor',
            backgroundColor: backgroundColor,
            action: () {
              Routing.navigateToScreen(context, Routes.RomanNumberConvertor);
            },
          ),
        ],
      )),
    );
  }
}
