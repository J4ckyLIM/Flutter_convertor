import 'package:flutter/material.dart';

class FileSizeConvertor extends StatefulWidget {
  FileSizeConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FileSizeConvertorState createState() => _FileSizeConvertorState();
}

class _FileSizeConvertorState extends State<FileSizeConvertor> {
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
