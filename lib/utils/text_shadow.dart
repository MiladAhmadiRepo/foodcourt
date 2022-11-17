import 'package:flutter/material.dart';

class TextShadow extends StatelessWidget {
  final childWidget;
  const TextShadow({Key? key, this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.amber,
            blurRadius: 5.0,
            spreadRadius: 5,
          )
        ],

      ),
      child: childWidget,
    );
  }
}
