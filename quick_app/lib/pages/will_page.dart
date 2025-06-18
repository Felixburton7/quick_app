import 'package:flutter/cupertino.dart';
import '../widgets/fun_fact_card.dart';

class WillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Will')),
      child: ListView(
        children: [
          SizedBox(height: 32),
          Icon(
            CupertinoIcons.person_2,
            size: 80,
            color: CupertinoColors.activeOrange,
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Will',
              style: CupertinoTheme.of(
                context,
              ).textTheme.navLargeTitleTextStyle,
            ),
          ),
          SizedBox(height: 24),
          WillBioSection(),
          FunFactCard(
            fact: "Will once biked 100 miles in a single day!",
            color: CupertinoColors.activeOrange,
            icon: CupertinoIcons.car,
          ),
          FunFactCard(
            fact: "Will is a coffee enthusiast and brews the best espresso.",
            color: CupertinoColors.activeOrange,
            icon: CupertinoIcons.time,
          ),
          FunFactCard(
            fact: "Will is a trivia night champion.",
            color: CupertinoColors.activeOrange,
            icon: CupertinoIcons.question_circle,
          ),
        ],
      ),
    );
  }
}

class WillBioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Height',
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.bold, color: CupertinoColors.black),
                ),
                SizedBox(height: 4),
                Text('1.98cm', style: TextStyle(color: CupertinoColors.black)),
              ],
            ),
            Column(
              children: [
                Text(
                  'Weight',
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: FontWeight.bold, color: CupertinoColors.black),
                ),
                SizedBox(height: 4),
                Text('200kg', style: TextStyle(color: CupertinoColors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
