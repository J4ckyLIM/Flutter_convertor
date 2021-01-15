import 'package:convertor/routes.dart';
import 'package:convertor/routing.dart';
import 'package:convertor/widgets/custom_drawer.dart';
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
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Tools',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum PossibleStyle {
  Grid,
  List,
  Card,
}

typedef void UpdateStyleCallback(PossibleStyle possibleStyle);

class _MyHomePageState extends State<MyHomePage> {
  final MaterialColor mainThemeColor = Colors.teal;

  PossibleStyle _displayType = PossibleStyle.Card;

  int _displayIndex = 3;

  int _scaleWidth = 1;

  int _scaleHeight = 1;

  void _changeDisplay(PossibleStyle possibleStyle) => setState(() {
        switch (possibleStyle) {
          case PossibleStyle.Card:
            _scaleWidth = 1;
            _displayIndex = 3;
            break;
          case PossibleStyle.Grid:
            _scaleWidth = 2;
            _displayIndex = 3;
            break;
          case PossibleStyle.List:
            _scaleWidth = 2;
            _scaleHeight = 1;
            _displayIndex = 1;
            break;
        }
        _displayType = possibleStyle;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: CustomDrawer(
        title: 'Coding Tools',
        headerColor: mainThemeColor,
        callback: (val) => _changeDisplay(val),
      ),
      body: Center(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: (_scaleWidth / _scaleHeight),
        crossAxisCount: _displayIndex,
        children: <Widget>[
          GridCell(
            title: 'File size convertor',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(context, Routes.FileSizeConvertor);
            },
            icon: Icons.description,
          ),
          GridCell(
            title: 'Lifetime calculator',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(context, Routes.BirthdayCalculator);
            },
            icon: Icons.timelapse,
          ),
          GridCell(
            title: 'Price reduction calculator',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(
                  context, Routes.PriceReductionCalculator);
            },
            icon: Icons.shopping_cart,
          ),
          GridCell(
            title: 'Date difference calculator',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(
                  context, Routes.DateDifferenceCalculator);
            },
            icon: Icons.calendar_today,
          ),
          GridCell(
            title: 'Distance convertor',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(context, Routes.DistanceConvertor);
            },
            icon: Icons.commute,
          ),
          GridCell(
            title: 'Binary convertor',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(context, Routes.FileSizeConvertor);
            },
            icon: Icons.filter_1,
          ),
          GridCell(
            title: 'Area convertor',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(context, Routes.AreaConvertor);
            },
            icon: Icons.crop_square,
          ),
          GridCell(
            title: 'Temperature convertor',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(context, Routes.TemperatureConvertor);
            },
            icon: Icons.ac_unit,
          ),
          GridCell(
            title: 'Roman number convertor',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(context, Routes.RomanNumberConvertor);
            },
            icon: Icons.account_balance,
          ),
          GridCell(
            title: 'Audio player',
            backgroundColor: mainThemeColor,
            action: () {
              Routing.navigateToScreen(context, Routes.AudioPlayer);
            },
            icon: Icons.music_note,
          ),
        ],
      )),
    );
  }
}
