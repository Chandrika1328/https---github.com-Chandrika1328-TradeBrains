import 'package:flutter/material.dart';

class TableTabWidget extends StatefulWidget {
  @override
  _TableTabWidgetState createState() => _TableTabWidgetState();
}

class _TableTabWidgetState extends State<TableTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WatchList'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('John')),
                DataCell(Text('25')),
                DataCell(Text('john@example.com')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Alice')),
                DataCell(Text('30')),
                DataCell(Text('alice@example.com')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Bob')),
                DataCell(Text('35')),
                DataCell(Text('bob@example.com')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
