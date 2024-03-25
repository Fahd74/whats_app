import 'package:flutter/material.dart';

void main() {
  runApp(WhatsAppChatScreen());
}

class WhatsAppChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          title: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(
                    'assets/images/user.png'),
              ),
              SizedBox(width: 8),
              Text(
                'Fahd',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {

              },
            ),
          ],
        ),
        // body:

        body: ChatBody(),
      ),
    );
  }
}

class ChatBody extends StatefulWidget {
  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatMessage(
                  message: _messages[index],
                  isMe: index % 2 == 0,
                );
              },
            ),
          ),
          Divider(height: 1),
          Container(
            color: Color(0xFF075E54),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.insert_emoticon),
                  onPressed: () {

                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onChanged: (String text) {

                      setState(() {});
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {

                    String message = _textController.text;
                    if (message.isNotEmpty) {
                      setState(() {
                        _messages.insert(0, message);
                      });
                      _textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;

  ChatMessage({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerLeft : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe
              ? Color(0xFFDCF8C6)
              : Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Flexible(
              child: Text(
                message,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(width: 4),
            Container(
              padding: EdgeInsets.fromLTRB(290, 0, 0, 0),
              child: Icon(
                isMe ? Icons.done_all : Icons.done,
                size: 13,
                color: isMe ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
