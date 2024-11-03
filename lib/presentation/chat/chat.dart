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
  late Future<Map<String, dynamic>> history;

  void sendMessage() async {
    var uri = Uri.https('test.mektep-zhmath.kz', '/chat/message');
    print(widget.createdChat['thread']['id']);
    var body = jsonEncode({
      'thread_ids': widget.createdChat['thread']['id'].toString(),
      'message': message.text.toString(),
    });
    var res = await http.post(uri,
        headers: {'Content-Type': 'application/json'}, body: body);
    var resJson = jsonDecode(res.body);
    print(resJson);
    history = getHistory(widget.createdChat['thread']['id']);
    setState(() {});
    var historyData = await history;
    print(historyData['data']);
  }

  Future<Map<String, dynamic>> getHistory(threadId) async {
    var uri = Uri.https('test.mektep-zhmath.kz',
        '/chat/allMessage/${widget.createdChat['thread']['id']}');
    print(widget.createdChat['thread']['id']);
    var body = jsonEncode({
      'thread_ids': widget.createdChat['thread']['id'].toString(),
      'message': message.text.toString(),
    });
    var res =
        await http.get(uri, headers: {'Content-Type': 'application/json'});
    var resJson = jsonDecode(res.body);
    return resJson;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    history = getHistory(widget.createdChat['thread']['id']);
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
            height: 500,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Expanded(
              child: FutureBuilder(
                future: history,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                      itemCount: snapshot.data?['data'].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            snapshot.data?['data'][index]['value'],
                            style: TextStyle(
                                color: snapshot.data?['data'][index]['role'] ==
                                        'user'
                                    ? Colors.green
                                    : Colors.white),
                          ),
                        );
                      },
                    );
                  }

                  return CircularProgressIndicator();
                },
              ),
            ),
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
                      labelStyle: TextStyle(color: Color(0xff989FA3))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
