import 'package:flutter/material.dart';
import 'package:foodcourt/utils/stroke_text.dart';
import 'package:foodcourt/utils/text_shadow.dart';
import 'package:foodcourt/utils/util.dart';

class FoodConceptHome extends StatelessWidget {
  const FoodConceptHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                Color(0xffA89276),
                Colors.white,
              ])),
            ),
          ),
          Positioned(
              top: getDeviceSize(context).height * 0.10,
              child: StrokeText(
                fontSize: 70,
                strokeColor: Colors.brown,
                textColor: Colors.brown.shade200,
                text: "FoodCourt",
              )
          ),
          Positioned(
              height: getDeviceSize(context).height * 0.25,
              left: 0,
              right: 0,
              top: getDeviceSize(context).height * 0.20,
              child: Hero(tag: '6', child: Image.asset(foods[6].imagePath))),
          Positioned(
              height: getDeviceSize(context).height * 0.40,
              left: 0,
              right: 0,
              bottom: getDeviceSize(context).height * 0.25,
              child: Hero(
                  tag: '7',
                  child: Image.asset(
                    foods[7].imagePath,
                    fit: BoxFit.cover,
                  ))),
          Positioned(
              height: getDeviceSize(context).height * 0.4,
              left: 0,
              right: 0,
              bottom: getDeviceSize(context).height * 0.05,
              child: Hero(
                  tag: '8',
                  child: Image.asset(
                    foods[8].imagePath,
                    fit: BoxFit.cover,
                  ))),
        ],
      ),
    );
  }
}
