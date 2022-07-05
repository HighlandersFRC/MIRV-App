import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:http/http.dart' as http;
import 'package:test/services/mirv_api.dart';

class RoverMetricsPage extends StatefulWidget {
  const RoverMetricsPage({Key? key}) : super(key: key);

  @override
  State<RoverMetricsPage> createState() => _RoverMetricsPageState();
}

class _RoverMetricsPageState extends State<RoverMetricsPage> {
  Future<http.Response> fetchAlbum() {
    return http
        .get(Uri.parse('https://mirvapi.azurewebsites.net/rovers/rover1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rover Metrics"),
      ),
    );
  }
}

class MetricDataTable extends StatelessWidget {
  MetricDataTable(RoverMetrics roverMetrics, {Key? key}) : super(key: key);

  final MirvApi _mirvApi = MirvApi();
  RoverMetrics roverMetrics = const RoverMetrics();

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 30,
      columns: const <DataColumn>[
        DataColumn(
          label: Text('roverID'),
        ),
        DataColumn(
          label: Text('rover 1'),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('state')),
            DataCell(Text("test")),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('status')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('battery')),
            DataCell(Text('69%')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('electronics')),
            DataCell(Text('bruh')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('drivetrain')),
            DataCell(Text('functional')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('intake')),
            DataCell(Text('intaking')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('sensors')),
            DataCell(Text('sensing')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('garage')),
            DataCell(Text('full')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('power')),
            DataCell(Text('weak sauce')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('general')),
            DataCell(Text('happy')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('longitude')),
            DataCell(Text('10.13081')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('latitude')),
            DataCell(Text('13239824')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('heading')),
            DataCell(Text('123.82')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('speed')),
            DataCell(Text('55')),
          ],
        ),
      ],
    );
  }
}
