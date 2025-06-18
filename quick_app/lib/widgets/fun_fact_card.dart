import 'package:flutter/cupertino.dart';

class FunFactCard extends StatelessWidget {
  final String fact;
  final Color color;
  final IconData icon;

  const FunFactCard({
    required this.fact,
    required this.color,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              fact,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
