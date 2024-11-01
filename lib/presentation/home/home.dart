import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpt_cl/presentation/chat/chat.dart';
import 'package:gpt_cl/presentation/main/main.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MainPage(),
          Center(child: Text('Second'),),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50)
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.green,
          onPressed:() {
            createChat() async {
              var uri = Uri.https('test.mektep-zhmath.kz', '/chat/create');
              var res = await http.post(uri);
              var resJson = jsonDecode(res.body);
              print(resJson);
              // return resJson;
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return Chat(
                  createdChat: resJson,
                );
              },));
            }
            createChat();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.green,
            ),
            padding: EdgeInsets.all(16),
            child: Icon(Icons.chat, color: Colors.white,)
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff141416),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(
            horizontal: 50
          ),
          child: Row(
            children: [
              ElevatedButton(
                onPressed:() {
                  _selectedIndex = 0;
                  setState(() {
                    
                  });
                }, 
                child: Column(
                  children: [
                    Icon(Icons.grid_view, color: _selectedIndex == 0 ? Colors.green : Colors.grey,),
                    Text('Главная', style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.green : Colors.grey
                    ),)
                  ],
                )
              ),
              Spacer(),
              ElevatedButton(
                onPressed:() {
                  _selectedIndex = 1;
                  setState(() {
                    
                  });
                }, 
                child: Column(
                  children: [
                    Icon(Icons.menu, color: _selectedIndex == 1 ? Colors.green : Colors.grey,),
                    Text('Настройки', style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.green : Colors.grey
                    ),)
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}