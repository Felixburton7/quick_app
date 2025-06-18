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
