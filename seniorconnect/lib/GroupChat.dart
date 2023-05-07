import 'package:flutter/material.dart';

enum MessageSender { self, other }

class ChatMessage {
  final String message;
  final MessageSender sender;

  ChatMessage({required this.message, required this.sender});
}

class GroupChatPage extends StatefulWidget {
  @override
  _GroupChatPageState createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  List<ChatMessage> messages = [
    ChatMessage(message: 'Hello!', sender: MessageSender.self),
    ChatMessage(message: 'How are you?', sender: MessageSender.other),
    ChatMessage(
        message: 'I\'m doing well. Thanks for asking.',
        sender: MessageSender.self),
    ChatMessage(
        message: 'Any plans for the weekend?', sender: MessageSender.other),
    ChatMessage(
        message: 'Not yet. Maybe we can catch up?', sender: MessageSender.self),
    ChatMessage(
        message: 'Sounds good. Let\'s plan it.', sender: MessageSender.other),
  ];

  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    setState(() {
      String newMessage = messageController.text;
      messages
          .add(ChatMessage(message: newMessage, sender: MessageSender.self));
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                ChatMessage chatMessage = messages[index];
                bool isSelf = chatMessage.sender == MessageSender.self;
                return Align(
                  alignment:
                      isSelf ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      color: isSelf ? Colors.blue : Colors.grey[200],
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          chatMessage.message,
                          style: TextStyle(
                              color: isSelf ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
