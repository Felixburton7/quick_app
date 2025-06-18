import 'package:flutter/cupertino.dart';
import 'pages/home_page.dart';
import 'pages/caspar_page.dart';
import 'pages/will_page.dart';
import 'pages/compare_page.dart';
import 'pages/gallery_page.dart';
import 'pages/settings_page.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(CasparVsWillApp());
}

class CasparVsWillApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Caspar vs Will',
      theme: AppTheme.cupertinoTheme,
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    CasparPage(),
    WillPage(),
    ComparePage(),
    GalleryPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Caspar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: 'Will',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_right_arrow_left),
            label: 'Compare',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      tabBuilder: (context, index) {
        return _pages[index];
      },
    );
  }
}
