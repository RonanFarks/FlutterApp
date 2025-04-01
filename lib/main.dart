import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:post_display/postdetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Retrieve Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<dynamic> _fetchedData = [];
  bool _isLoading = true;
  String _errorMessage = '';
  bool isDarkMode = false;
  int? _selectedItemId;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Retrieve Data'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
          ? Center(child: Text(_errorMessage))
          : ListView.builder(
        itemCount: _fetchedData.length,
        itemBuilder: (context, index) {
          final item = _fetchedData[index];
          final itemID = item['id'];
          return Slidable(
            key: ValueKey(itemID),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    Navigator.push(
                      context, // Use the context from the current build method.
                      MaterialPageRoute(
                        builder: (context) => PostDetail(item: item),
                      ),
                    );
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'View',
                ),
              ],
            ),

            child: ListTile(
              title: Text('ID: ${item['id']}'),
              subtitle: Text('Title: ${item['title']}'),
              tileColor: _selectedItemId == itemID
                  ? Colors.blue.withOpacity(0.3)
                  : null,
              onTap: () {
                setState(() {
                  _selectedItemId = itemID;
                });
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(item['title']),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('User ID:',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(item['userId'].toString()),
                        Text('Body:',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(item['body'])
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (bool clothing) {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
                activeColor: Colors.red,
                activeTrackColor: Colors.redAccent.withOpacity(0.5),
                inactiveTrackColor: Colors.grey.withOpacity(0.5),
                inactiveThumbColor: Colors.grey,
              ),
              onTap: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<dynamic>> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> _load() async {
    try {
      _fetchedData = await getData();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }
}
