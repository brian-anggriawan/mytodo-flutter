import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.list,
          size: 30,
          color: Colors.blue,
        ),
      ),
    );
  }
}
