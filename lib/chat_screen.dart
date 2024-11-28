import 'package:flutter/material.dart';
import 'package:whatsapp_ui/models/contacts.dart';
import 'package:whatsapp_ui/models/models/message.dart';

class ChatScreen extends StatefulWidget {
  final Contact contact;

  const ChatScreen({super.key, required this.contact});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [
    Message(sender: 'You', text: 'Hello!', time: '10:00 AM'),
    Message(sender: 'John', text: 'Hi, how are you?', time: '10:05 AM'),
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(Message(sender: 'You', text: _controller.text, time: '10:10 AM'));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              // Video call action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Align(
                    alignment: message.sender == 'You' ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: message.sender == 'You' ? Colors.green[200] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(message.text),
                    ),
                  ),
                  subtitle: Align(
                    alignment: message.sender == 'You' ? Alignment.centerRight : Alignment.centerLeft,
                    child: Text(message.time),
                  ),
                );
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
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
