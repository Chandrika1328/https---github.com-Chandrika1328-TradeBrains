import 'package:flutter/material.dart';
import 'package:sqlite/search_tab.dart';
import 'package:sqlite/table_tab.dart';

void main() {
  runApp(TableTemplateApp());
}

class TableTemplateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table Template App',
      home: TableTemplate(),
    );
  }
}

class TableTemplate extends StatefulWidget {
  @override
  _TableTemplateState createState() => _TableTemplateState();
}

class _TableTemplateState extends State<TableTemplate> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0 ? SearchTabWidget() : TableTabWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Watchlist',
          ),
        ],
      ),
    );
  }
}
