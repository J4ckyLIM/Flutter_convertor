import 'package:convertor/main.dart';
import 'package:convertor/routes.dart';
import 'package:convertor/screens/area_convertor.dart';
import 'package:convertor/screens/date_calculator.dart';
import 'package:convertor/screens/distance_convertor.dart';
import 'package:convertor/screens/file_size_convertor.dart';
import 'package:convertor/screens/price_reduction_calculator.dart';
import 'package:convertor/screens/roman_convertor.dart';
import 'package:convertor/screens/temperature_convertor.dart';
import 'package:flutter/material.dart';

class Routing {
  static void navigatoToScreen(BuildContext context, Routes route) {
    switch (route) {
      case Routes.AreaConvertor:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AreaConvertor(title: 'Area convertor')),
        );
        break;
      case Routes.DateDifferenceCalculator:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DateCalculator(title: 'Date difference calculator')),
        );
        break;
      case Routes.DistanceConvertor:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DistanceConvertor(title: 'Distance convertor')),
        );
        break;
      case Routes.FileSizeConvertor:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FileSizeConvertor(title: 'File size convertor')),
        );
        break;
      case Routes.PriceReductionCalculator:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PriceReductionCalculator(
                  title: 'Price reduction calculator')),
        );
        break;
      case Routes.RomanNumberConvertor:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  RomanConvertor(title: 'Roman number convertor')),
        );
        break;
      case Routes.TemperatureConvertor:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TemperatureConvertor(title: 'Temperature convertor')),
        );
        break;
      default:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: 'Tools')),
        );
    }
  }
}
