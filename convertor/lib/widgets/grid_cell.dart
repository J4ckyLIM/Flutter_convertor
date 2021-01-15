import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  GridCell({Key key, this.title, this.backgroundColor, this.icon, this.action})
      : super(key: key);

  final String title;
  final MaterialColor backgroundColor;
  final IconData icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.action,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: this.backgroundColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                this.title.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                this.icon ?? Icons.ac_unit_outlined,
                size: 80,
              ),
            ],
          ),
        ));
  }
}
