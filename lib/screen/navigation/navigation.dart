import 'package:flutter/material.dart';
import 'package:namer_app/screen/introduction/home.dart';
import 'package:namer_app/screen/setting/settings.dart';
import 'package:namer_app/screen/showtimes/showtimes.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static List<WidgetBuilder> _widgetOptions = <WidgetBuilder>[
    (context) => Home(),
    (context) => Showtimes(),
    (context) => Home(),
    (context) => Home(),
    (context) => Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lịch chiếu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // Chọn màu cho các mục chưa được chọn
        onTap: _onItemTapped,
      ),
    );
  }
}
