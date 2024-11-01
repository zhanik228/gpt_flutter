import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gpt_cl/common/components/category_cart.dart';
import 'package:gpt_cl/common/components/history_cart.dart';

class CartWrapper extends StatefulWidget {
  final title;
  final cartType;
  const CartWrapper({required this.title, this.cartType, super.key});

  @override
  State<CartWrapper> createState() => _CartWrapperState();
}

class _CartWrapperState extends State<CartWrapper> {
  var _selectedIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9
  );

  void makeAnimation() {
    var timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == 3) {
        _pageController.animateToPage(
          0, 
          duration: Duration(milliseconds: 500), 
          curve: Curves.linear
        );
      } else {
        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '${widget.title}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),
                Text('Смотреть все', style: TextStyle(
                  color: Colors.grey
                ),),
              ],
            ),
          ),
          SizedBox(height: 12,),
          Container(
            height: 121,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              controller: _pageController,
              itemBuilder:(context, index) {
                return AnimatedBuilder(
                  animation: _pageController, 
                  builder:(context, child) {
                    return widget.cartType != null 
                    ? HistoryCart() 
                    : widget.cartType == 'history' 
                    ? HistoryCart()
                    : CategoryCart();
                  },
                );
              },
              itemCount: 4,
            ),
          ),
        ],
      );
  }
}