import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  final dynamic item;

  const PostDetail({super.key, required this.item});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
        backgroundColor: Colors.red,
      ),
      body: widget.item != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item['title'],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'User ID:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.item['userId'].toString()),
                const SizedBox(height: 8),
                const Text(
                  'Body:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.item['body']),
                // Add more fields as needed
              ],
            ),
          ),
        ),
      )
          : const Center(
        child: Text(
          'No post data available.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}