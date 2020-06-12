import 'package:flutter/material.dart';
import 'package:TaskAssigner/screens/task_status.dart';
import 'package:TaskAssigner/screens/view_tasks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        backgroundColor: Color.fromRGBO(18, 69, 89, 1.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidUser),
              title: Text('Tasks for me')),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userTie),
              title: Text('Tasks by me')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(174, 195, 175, 1.0),
        unselectedItemColor: Color.fromRGBO(89, 131, 146, 1.0),
        onTap: _onItemTapped,
      ),
      body: _navOptions.elementAt(_selectedIndex),
    );
  }
}
