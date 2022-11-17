import 'package:flutter/material.dart';
import 'package:foodcourt/screens/food_concept_list.dart';
import 'package:foodcourt/utils/stroke_text.dart';
import 'package:foodcourt/utils/glow_widget.dart';
import 'package:foodcourt/utils/util.dart';

class FoodConceptHome extends StatelessWidget {
  const FoodConceptHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          print(details.primaryDelta.toString());
          if (details.primaryDelta! < -15) {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 1250),
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
                  textColor: Colors.orangeAccent,
                  text: "FoodCourt",
                )),
            Positioned(
                height: getDeviceSize(context).height * 0.25,
                left: 0,
                right: 0,
                top: getDeviceSize(context).height * 0.25,
                child: Hero(
                    tag: foods[7].name,
                    child: GlowWidget(
                      child: Image.asset(foods[7].imagePath),
                      color: Colors.yellow,
                      opacity: 0.5,
                      offset: Offset(0.0, 0.0),
                      sigma: 40.0,
                    ))),
            Positioned(
                height: getDeviceSize(context).height * 0.35,
                left: 0,
                right: 0,
                bottom: getDeviceSize(context).height * 0.25,
                child: Hero(
                    tag: foods[8].name,
                    child: GlowWidget(
                      child: Image.asset(
                        foods[8].imagePath,
                        fit: BoxFit.cover,
                      ),
                      color: Colors.yellow,
                      opacity: 0.5,
                      offset: Offset(0.0, 0.0),
                      sigma: 40.0,
                    ))),
            Positioned(
                height: getDeviceSize(context).height * 0.45,
                left: 0,
                right: 0,
                bottom: -getDeviceSize(context).height * 0.01,
                child: Hero(
                    tag: foods[9].name,
                    child: GlowWidget(
                      child: Image.asset(
                        foods[9].imagePath,
                        fit: BoxFit.cover,
                      ),
                      color: Colors.yellow,
                      opacity: 0.5,
                      offset: Offset(0.0, 0.0),
                      sigma: 40.0,
                    ))),
          ],
        ),
      ),
    );
  }
}
