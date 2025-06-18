import 'package:flutter/cupertino.dart';
import '../widgets/fun_fact_card.dart';

class CasparPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Caspar')),
      child: ListView(
        children: [
          SizedBox(height: 32),
          Icon(
            CupertinoIcons.person,
            size: 80,
            color: CupertinoColors.activeBlue,
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Caspar',
              style: CupertinoTheme.of(
                context,
              ).textTheme.navLargeTitleTextStyle,
            ),
          ),
          SizedBox(height: 24),
          FunFactCard(
            fact: "Caspar can solve a Rubik's cube in under a minute!",
            color: CupertinoColors.activeBlue,
            icon: CupertinoIcons.cube_box,
          ),
          FunFactCard(
            fact: "Caspar loves hiking and has climbed 10+ mountains.",
            color: CupertinoColors.activeBlue,
            icon: CupertinoIcons.tree,
          ),
          FunFactCard(
            fact: "Caspar loves Kenny",
            color: CupertinoColors.activeBlue,
            icon: CupertinoIcons.game_controller,
          ),
          FunFactCard(
            fact: "Caspar is a master at board games.",
            color: CupertinoColors.activeBlue,
            icon: CupertinoIcons.game_controller,
          ),
        ],
      ),
    );
  }
}
