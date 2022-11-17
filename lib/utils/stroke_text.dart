import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color strokeColor;
  final double fontSize;
  const StrokeText({Key? key, required this.text, required this.textColor, required this.strokeColor, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'bee',

            shadows: [
              Shadow(
                offset: Offset(10.0, 10.0),
                blurRadius: 10.0,
                color: Colors.brown.shade500,
              ),
            ],
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = strokeColor,

          ),

        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontFamily: 'bee',

            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
