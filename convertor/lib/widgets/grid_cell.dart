import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  GridCell({Key key, this.title, this.backgroundColor, this.icon, this.action})
      : super(key: key);

  final String title;
  final MaterialColor backgroundColor;
  final ImageIcon icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.action,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                this.title,
                style: TextStyle(color: Colors.white),
              ),
              Container(
                color: Colors.grey,
                width: 80,
                height: 80,
              ),
            ],
          ),
          color: this.backgroundColor,
        ));
  }
}
