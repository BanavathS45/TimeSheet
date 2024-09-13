import 'package:flutter/material.dart';

class RepeatedScreen extends StatefulWidget {
  final Color bgColor;
  final String title;
  const RepeatedScreen(
      {super.key, this.bgColor = Colors.red, this.title = "Hello"});

  @override
  State<RepeatedScreen> createState() => _RepeatedScreenState();
}

class _RepeatedScreenState extends State<RepeatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: widget.bgColor,
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
