import 'package:flutter/material.dart';

class AreaConvertor extends StatefulWidget {
  AreaConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AreaConvertorState createState() => _AreaConvertorState();
}

class _AreaConvertorState extends State<AreaConvertor> {
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
