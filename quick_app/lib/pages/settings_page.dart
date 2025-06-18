import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Settings')),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.settings,
              size: 80,
              color: CupertinoColors.systemGrey,
            ),
            SizedBox(height: 16),
            Text(
              'Settings',
              style: CupertinoTheme.of(
                context,
              ).textTheme.navLargeTitleTextStyle,
            ),
            SizedBox(height: 8),
            Text('Theme switcher and app info coming soon!'),
          ],
        ),
      ),
    );
  }
}
