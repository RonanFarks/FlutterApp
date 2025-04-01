import 'package:flutter/material.dart';

class DarkModeTile extends StatefulWidget {
  final ValueChanged<bool> onToggle;
  final bool initialValue;

  const DarkModeTile({super.key, required this.onToggle, required this.initialValue});

  @override
  _DarkModeTile createState() => _DarkModeTile();
}

class _DarkModeTile extends State<DarkModeTile> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.dark_mode),
      title: const Text('Dark Mode'),
      trailing: Switch(
        value: _isDarkMode,
        onChanged: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
          widget.onToggle(value);
        },
      ),
      onTap: () {
        setState(() {
          _isDarkMode = !_isDarkMode;
        });
        widget.onToggle(_isDarkMode);
      },
    );
  }
}

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key});

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  bool darkModeEnabled = false;

  void _onDarkModeChanged(bool value) {
    setState(() {
      darkModeEnabled = value;
      print('Dark mode toggled: $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          DarkModeTile(
            onToggle: _onDarkModeChanged,
            initialValue: darkModeEnabled,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              // Handle profile tap
            },
          ),
        ],
      ),
    );
  }
}