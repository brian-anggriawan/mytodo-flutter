import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback? action;

  const CustomFloatingButton({this.action});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      onPressed: action,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
