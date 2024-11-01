import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  final createdChat;
  const Chat({required this.createdChat, super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController message = TextEditingController();
  

  void sendMessage() async {
    var uri = Uri.https('test.mektep-zhmath.kz', '/chat/message');
    print(widget.createdChat['thread']['id']);
    var body = jsonEncode({
      'thread_ids': widget.createdChat['thread']['id'].toString(),
      'message': message.text.toString(),
    });
    var res = await http.post(uri,
      headers: {
        'Content-Type': 'application/json'
      },
     body: body);
    var resJson = jsonDecode(res.body);
    print(resJson);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.createdChat);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nano AI'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16
            ),
            child: Text('Text'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff141416),
        child: Container(
          child: Row(
            children: [
              Container(
                width: 200,
                child: TextField(
                  onSubmitted: (value) {
                    sendMessage();
                  },
                  controller: message,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xff989FA3).withOpacity(0.08),
                    labelText: 'Введите текст...',
                    labelStyle: TextStyle(
                      color: Color(0xff989FA3)
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}