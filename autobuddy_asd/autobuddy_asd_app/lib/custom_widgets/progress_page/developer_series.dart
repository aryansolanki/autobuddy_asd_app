import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class DeveloperSeries {
  final DateTime year;
  final num developers;
  final charts.Color barColor;

  DeveloperSeries(
      {required this.year, required this.developers, required this.barColor});
}
