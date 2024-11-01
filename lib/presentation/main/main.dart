import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpt_cl/common/components/cart_wrapper.dart';
import 'package:gpt_cl/common/components/history_cart.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<Map<String, dynamic>> _users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _users = getUsers();
  }

  // Future<Map<String, dynamic>> getUsers() async {
  //   var uri = Uri.https('test.mektep-zhmath.kz', '/api/users');
  //   var res = await http.get(uri);
  //   var resJson = jsonDecode(res.body);
  //   print(resJson);
  //   setState(() {
      
  //   });
  //   return resJson;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главная', style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CartWrapper(title: 'История', cartType: 'history',),
          CartWrapper(title: '💪 Здоровье')
        ],
      )
    );
  }
}