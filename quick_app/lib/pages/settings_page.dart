import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  const SettingsPage({Key? key, required this.isDarkMode, required this.onThemeChanged}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _infoExpanded = false;
  int _compareCardLimit = 10;

  static const String compareLimitPrefKey = 'compareCardLimit';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _compareCardLimit = prefs.getInt(compareLimitPrefKey) ?? 10;
    });
  }

  Future<void> _setCompareLimit(int value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _compareCardLimit = value;
    });
    await prefs.setInt(compareLimitPrefKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Settings')),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          // Theme Toggle Card
          _buildThemeCard(),
          SizedBox(height: 16),
          // App Info Card
          _buildAppInfoCard(),
          SizedBox(height: 16),
          // Compare Card Limit Card
          _buildCompareLimitCard(),
        ],
      ),
    );
  }

  Widget _buildThemeCard() {
    return CupertinoFormSection(
      header: Text('App Theme'),
      children: [
        CupertinoFormRow(
          prefix: Text('App Theme'),
          child: CupertinoSwitch(
            value: widget.isDarkMode,
            onChanged: widget.onThemeChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildAppInfoCard() {
    return CupertinoFormSection(
      header: GestureDetector(
        onTap: () {
          setState(() {
            _infoExpanded = !_infoExpanded;
          });
        },
        child: Row(
          children: [
            Expanded(child: Text('App Info')),
            Icon(_infoExpanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down),
          ],
        ),
      ),
      children: [
        if (_infoExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Text(
              'Quick App helps you compare items, view fun facts, and customize your experience. Use the settings to personalize the app to your preferences.',
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
          )
        else
          Container(height: 0),
      ],
    );
  }

  Widget _buildCompareLimitCard() {
    return CupertinoFormSection(
      header: Text('Compare Card Limit'),
      children: [
        CupertinoFormRow(
          prefix: Text('Cards per session'),
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 32,
                child: Icon(CupertinoIcons.minus_circle),
                onPressed: _compareCardLimit > 5
                    ? () => _setCompareLimit(_compareCardLimit - 1)
                    : null,
              ),
              SizedBox(width: 8),
              Text('$_compareCardLimit'),
              SizedBox(width: 8),
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 32,
                child: Icon(CupertinoIcons.add_circled),
                onPressed: _compareCardLimit < 20
                    ? () => _setCompareLimit(_compareCardLimit + 1)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
