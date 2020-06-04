import 'package:flutter/material.dart';
import 'package:DoMyBidding/screens/task_status.dart';
import 'package:DoMyBidding/screens/view_tasks.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _navOptions = <Widget>[
    TasksScreen(),
    TaskStatusScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.move_to_inbox), title: Text('Tasks for me')),
          BottomNavigationBarItem(
              icon: Icon(Icons.send), title: Text('Tasks by me')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(174, 195, 175, 1.0),
        onTap: _onItemTapped,
      ),
      body: _navOptions.elementAt(_selectedIndex),
    );
  }
}
