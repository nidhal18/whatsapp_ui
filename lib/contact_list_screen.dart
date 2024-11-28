import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chat_screen.dart';
import 'package:whatsapp_ui/models/contacts.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({super.key});
  final List<Contact> contacts = [
    Contact(
        name: 'Ajaya Jonan', lastMessage: 'Hey, what\'s up?', isOnline: true),
    Contact(
        name: 'Chemban Vinod',
        lastMessage: 'Can you send the files?',
        isOnline: false),
    Contact(name: 'Vamanan', lastMessage: 'Let\'s meet later.', isOnline: true),
    Contact(
        name: 'A.P. Biju',
        lastMessage: 'Call me when you\'re free.',
        isOnline: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Navigate to chat list screen (if implemented)
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Settings action
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: contact.isOnline ? Colors.green : Colors.grey,
              child: Text(contact.name[0]),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.lastMessage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
