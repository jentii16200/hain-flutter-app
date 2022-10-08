import 'package:flutter/material.dart';

class HainText extends StatelessWidget {
  final String title;
  final double fontSize;
  const HainText({required this.title, this.fontSize = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.replaceAll("\\n", "\n"),
      maxLines: 3,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.justify,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }
}
