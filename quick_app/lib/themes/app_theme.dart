import 'package:flutter/cupertino.dart';

class AppTheme {
  static final cupertinoTheme = CupertinoThemeData(
    primaryColor: CupertinoColors.activeBlue,
    primaryContrastingColor: CupertinoColors.activeOrange,
    barBackgroundColor: CupertinoColors.systemGrey6,
    scaffoldBackgroundColor: CupertinoColors.systemBackground,
    textTheme: CupertinoTextThemeData(
      navLargeTitleTextStyle: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.label,
      ),
      textStyle: TextStyle(fontSize: 18, color: CupertinoColors.label),
    ),
  );
}
