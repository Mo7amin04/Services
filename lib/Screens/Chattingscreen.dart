import 'package:flutter/material.dart';

class Chatting_Page extends StatefulWidget {
  const Chatting_Page({super.key});

  @override
  State<Chatting_Page> createState() => _Chatting_PageState();
}

class _Chatting_PageState extends State<Chatting_Page> {
  final List<String> _messages = [
  ];
  final List<int> numbers = [
    1,
    2,
    3,
    4,
    5,

  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text); // Add message to list
        _controller.clear(); // Clear input field after sending message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(),
            SizedBox(
              width: 10,
            ),
            Text("name")
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return myMessage(index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage, // Send the message
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myMessage(int index) {
    return ListTile(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _messages[index],
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget otherMessage(int index) {
    return ListTile(
      title: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
           // color: Colors.green[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _messages[index],
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

}
