import 'package:flutter/material.dart';
import 'package:foodcourt/screens/food_concept_list.dart';
import 'package:foodcourt/utils/stroke_text.dart';
import 'package:foodcourt/utils/text_shadow.dart';
import 'package:foodcourt/utils/util.dart';

class FoodConceptHome extends StatelessWidget {
  const FoodConceptHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -20) {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: FoodConceptList(
                      title: '',
                    ),
                  );
                },
              ),
            );
          }
        },
        child: Stack(
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
                  fontSize: 100,
                  strokeColor: Colors.brown.shade300,
                  textColor: Colors.orange.shade200,
                  text: "FoodCourt",
                )),
            Positioned(
                height: getDeviceSize(context).height * 0.25,
                left: 0,
                right: 0,
                top: getDeviceSize(context).height * 0.25,
                child: Hero(
                    tag: '6',
                    child: GlowWidget(
                      child: Image.asset(foods[6].imagePath),
                      color: Colors.orange,
                      opacity: 0.8,
                      offset: Offset(
                       0.0,0.0
                      ),
                      sigma: 40.0,
                    ))),
            Positioned(
                height: getDeviceSize(context).height * 0.40,
                left: 0,
                right: 0,
                bottom: getDeviceSize(context).height * 0.2,
                child: Hero(
                    tag: '7',
                    child: Image.asset(
                      foods[7].imagePath,
                      fit: BoxFit.cover,
                    ))),
            Positioned(
                height: getDeviceSize(context).height * 0.35,
                left: 0,
                right: 0,
                bottom: -getDeviceSize(context).height * 0.01,
                child: Hero(
                    tag: '9',
                    child: Image.asset(
                      foods[9].imagePath,
                      fit: BoxFit.cover,
                    ))),
          ],
        ),
      ),
    );
  }
}
