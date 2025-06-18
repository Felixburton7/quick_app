import 'package:flutter/cupertino.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Gallery')),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.photo,
              size: 80,
              color: CupertinoColors.activeGreen,
            ),
            SizedBox(height: 16),
            Text(
              'Gallery',
              style: CupertinoTheme.of(
                context,
              ).textTheme.navLargeTitleTextStyle,
            ),
            SizedBox(height: 8),
            Text('Photos, quotes, and stories coming soon!'),
          ],
        ),
      ),
    );
  }
}
