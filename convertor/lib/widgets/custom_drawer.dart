import 'package:convertor/main.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key key, this.title, this.headerColor, this.callback})
      : super(key: key);

  final String title;

  final MaterialColor headerColor;

  final UpdateStyleCallback callback;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              this.title,
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: this.headerColor,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Select a display style'),
          ),
          ListTile(
            title: Text('List'),
            onTap: () {
              callback(PossibleStyle.List);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Grid'),
            onTap: () {
              callback(PossibleStyle.Grid);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Card'),
            onTap: () {
              callback(PossibleStyle.Card);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
