import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String value;
  const DetailCard({
    super.key,
    required this.title,
    required this.value
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 249, 252),
        borderRadius:BorderRadius.circular(12), 
      ),
      child: Column(
        children: [
          Text(
            title,
            style:TextStyle(
              color: Color.fromARGB(255, 100, 116, 139),
              fontSize: 14,
            ) ,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            value,
            style: TextStyle(
              color: Color.fromARGB(255, 26, 40, 86) ,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}