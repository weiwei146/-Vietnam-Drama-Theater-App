import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screen/introduction/home.dart';
import 'package:namer_app/screen/review/review.dart';
import 'package:namer_app/screen/setting/settings.dart';


class Navigation extends StatefulWidget {
  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static List<WidgetBuilder> _widgetOptions = <WidgetBuilder>[
    (context) => Home(),
    (context) => Home(),
    (context) => ReviewScreen(),
    (context) => ReviewScreen(),
    (context) => Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)(context),
        ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Trang chủ'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.event),
            title: Text('Lịch diễn'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.folder),
            title: Text('Thư viện'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.newspaper),
            title: Text('Tin tức'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.settings),
            title: Text('Cài đặt'),
          ),
        ],
      )
    );
  }
}
