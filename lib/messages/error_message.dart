import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final IconData icon;

  const ErrorMessage({Key? key, required this.message, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        Text(message),
      ],
    ));
  }
}
