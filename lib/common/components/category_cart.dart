import 'dart:math';

import 'package:flutter/material.dart';

class CategoryCart extends StatefulWidget {
  const CategoryCart({super.key});

  @override
  State<CategoryCart> createState() => _CategoryCartState();
}

class _CategoryCartState extends State<CategoryCart> {
  var generatedColor = new Random().nextInt(Colors.primaries.length);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 121,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff90A4AE).withOpacity(0.15),
        gradient: LinearGradient(
          colors: [
            Colors.primaries[generatedColor],
            Colors.white,
          ]
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Йога'),
          Text('Йога - это отличный способ улучшить своё здоровье и настроение!')
        ],
      ),
    );
  }
}