import 'package:flutter/material.dart';
import 'package:mirv/models/rover_metrics.dart';

class TelemeteryDataTable extends StatelessWidget {
  final RoverMetricTelemetry roverMetrics;
  const TelemeteryDataTable({Key? key, required this.roverMetrics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const [
      DataColumn(label: Text('Longitude')),
      DataColumn(label: Text('Latitude')),
      DataColumn(label: Text('Heading')),
      DataColumn(label: Text('Speed')),
    ], rows: [
      DataRow(cells: [
        DataCell(Text('${roverMetrics.location.long}')),
        DataCell(Text('${roverMetrics.location.lat}')),
        DataCell(Text('${roverMetrics.heading}')),
        DataCell(Text('${roverMetrics.speed}')),
      ]),
    ]);
  }
}
