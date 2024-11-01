import 'package:flutter/material.dart';

class HistoryCart extends StatefulWidget {
  const HistoryCart({super.key});

  @override
  State<HistoryCart> createState() => _HistoryCartState();
}

class _HistoryCartState extends State<HistoryCart> {
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Какая самая длинная река?...'),
          SizedBox(height: 8,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Color(0xff90A4AE).withOpacity(0.15),
          ),
          Text('Самая длинная река - это'),
          Row(
            children: [
              Text('19 Июня 2023', style: TextStyle(
                color: Color(0xff989FA3)
              ),),
              SizedBox(width: 8,),
              Container(
                height: 3,
                width: 3,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              SizedBox(width: 8,),
              Text('21:47', style: TextStyle(
                color: Color(0xff989FA3)
              ),)
            ],
          )
        ],
      ),
    );
  }
}