import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Colors, Card, RoundedRectangleBorder; // For card backgrounds
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class ComparePage extends StatefulWidget {
  @override
  _ComparePageState createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  final List<Map<String, String>> battles = [
    {
      'prompt': 'Who would survive longer in a zombie apocalypse?',
      'emoji': '🧟',
    },
    {'prompt': 'Who would be the worst roommate?', 'emoji': '🏠'},
    {'prompt': 'Who would win in a karaoke battle?', 'emoji': '🎤'},
    {'prompt': 'Who would be the first to get arrested?', 'emoji': '🚔'},
    {'prompt': 'Who would be the worst at keeping a secret?', 'emoji': '🤫'},
    {'prompt': 'Who would be the first to cry during a movie?', 'emoji': '😢'},
    {'prompt': 'Who would be the worst at parallel parking?', 'emoji': '🅿️'},
    {'prompt': 'Who would be the first to get lost in IKEA?', 'emoji': '🪑'},
    {
      'prompt': 'Who would be the worst at playing hide and seek?',
      'emoji': '👀',
    },
    {'prompt': 'Who would be the first to break their phone?', 'emoji': '📱'},
    {
      'prompt': 'Who would be the worst at keeping plants alive?',
      'emoji': '🌱',
    },
    {'prompt': 'Who would be the first to get food poisoning?', 'emoji': '🤢'},
    {'prompt': 'Who would be the worst at giving directions?', 'emoji': '🗺️'},
    {'prompt': 'Who would be the first to get sunburned?', 'emoji': '☀️'},
    {
      'prompt': 'Who would be the worst at keeping a straight face?',
      'emoji': '😏',
    },
  ];

  int casparScore = 0;
  int willScore = 0;
  int currentIndex = 0;
  bool finished = false;

  void _onSwipe(CardSwiperDirection dir) {
    setState(() {
      if (dir == CardSwiperDirection.right) {
        casparScore++;
      } else if (dir == CardSwiperDirection.left) {
        willScore++;
      }
      currentIndex++;
      if (currentIndex >= battles.length) {
        finished = true;
      }
    });
  }

  void _reset() {
    setState(() {
      casparScore = 0;
      willScore = 0;
      currentIndex = 0;
      finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Compare')),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              'Caspar: $casparScore   |   Will: $willScore',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.activeBlue,
              ),
            ),
            SizedBox(height: 16),
            if (!finished)
              Expanded(
                child: CardSwiper(
                  cardsCount: battles.length,
                  numberOfCardsDisplayed: 2,
                  isLoop: false,
                  onSwipe: (previousIndex, currentIndex, direction) {
                    if (direction == CardSwiperDirection.right ||
                        direction == CardSwiperDirection.left) {
                      _onSwipe(direction);
                      return true;
                    }
                    return false;
                  },
                  onEnd: _reset,
                  cardBuilder: (context, index, percentX, percentY) {
                    final battle = battles[index];
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 6,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              battle['emoji'] ?? '',
                              style: TextStyle(fontSize: 80),
                            ),
                            SizedBox(height: 32),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Text(
                                battle['prompt'] ?? '',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 32),
                            Text(
                              'Swipe right for Caspar, left for Will!',
                              style: TextStyle(
                                fontSize: 16,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        casparScore > willScore
                            ? '🎉 Caspar Wins!'
                            : (willScore > casparScore
                                  ? '🔥 Will Wins!'
                                  : '🤝 It\'s a Tie!'),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Text('Final Score', style: TextStyle(fontSize: 22)),
                      Text(
                        'Caspar: $casparScore   |   Will: $willScore',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 32),
                      CupertinoButton.filled(
                        child: Text('Play Again'),
                        onPressed: _reset,
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
