import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Caspar vs Will')),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Caspar vs Will!',
              style: CupertinoTheme.of(
                context,
              ).textTheme.navLargeTitleTextStyle,
            ),
            SizedBox(height: 16),
            Text(
              'Explore the tabs below to learn more about Caspar and Will, compare them, and have fun!',
              style: CupertinoTheme.of(context).textTheme.textStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Icon(
              CupertinoIcons.smiley,
              size: 60,
              color: CupertinoColors.activeBlue,
            ),
          ],
        ),
      ),
    );
  }
}
