import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class CasparVsWillApp extends StatefulWidget {
  @override
  _CasparVsWillAppState createState() => _CasparVsWillAppState();
}

class _CasparVsWillAppState extends State<CasparVsWillApp> {
  bool _isDarkMode = false;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _initialized = true;
    });
  }

  Future<void> _updateTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = isDark;
    });
    await prefs.setBool('isDarkMode', isDark);
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const CupertinoApp(
        home: Center(child: CupertinoActivityIndicator()),
      );
    }
    return CupertinoApp(
      title: 'Caspar vs Will',
      theme: _isDarkMode
          ? CupertinoThemeData(brightness: Brightness.dark)
          : AppTheme.cupertinoTheme,
      home: MainNavigation(
        isDarkMode: _isDarkMode,
        onThemeChanged: _updateTheme,
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  MainNavigation({required this.isDarkMode, required this.onThemeChanged});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      CasparPage(),
      WillPage(),
      ComparePage(),
      GalleryPage(),
      SettingsPage(
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
      ),
    ];
  }

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
