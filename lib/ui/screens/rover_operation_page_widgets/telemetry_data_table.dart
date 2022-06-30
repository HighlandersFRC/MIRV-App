import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';

class TelemeteryDataTable extends StatelessWidget {
  final RoverMetricTelemetry roverMetrics;
  const TelemeteryDataTable({Key? key, required this.roverMetrics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return roverMetrics != null
        ? DataTable(columns: [
            DataColumn(label: Text('longitude')),
            DataColumn(label: Text('latitude')),
            DataColumn(label: Text('heading')),
            DataColumn(label: Text('Speed')),
          ], rows: [
            DataRow(cells: [
              DataCell(Text('${roverMetrics.location.long}')),
              DataCell(Text('${roverMetrics.location.long}')),
              DataCell(Text('${roverMetrics.heading}')),
              DataCell(Text('${roverMetrics.speed}')),
            ]),
          ])
        : Text('Waiting on data');
  }
}
