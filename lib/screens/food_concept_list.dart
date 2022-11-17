import 'package:flutter/material.dart';

import '../utils/scroll_class.dart';
import '../utils/util.dart';

class FoodConceptList extends StatefulWidget {
  const FoodConceptList({super.key, required this.title});

  final String title;

  @override
  State<FoodConceptList> createState() => _FoodConceptListState();
}

class _FoodConceptListState extends State<FoodConceptList> {
  static const _initialPage=8.0;
  double _currentPage = _initialPage;
  double _textPage = _initialPage;
  PageController _pageController = PageController(
      initialPage: _initialPage.toInt(),
      viewportFraction: 0.3);
  PageController _pageTextController = PageController(
    initialPage: _initialPage.toInt(),

  );
  final Duration _duration = Duration(milliseconds: 300);
  void _foodControllerListener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  void _TextControllerListener() {
    _textPage = _currentPage;
  }

  @override
  void initState() {
    _pageController.addListener(_foodControllerListener);
    _pageTextController.addListener(_TextControllerListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_foodControllerListener);
    _pageController.dispose();
    _pageTextController.removeListener(_TextControllerListener);
    _pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -getDeviceSize(context).height * 0.2,
            height: getDeviceSize(context).height * 0.33,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.brown, blurRadius: 110, offset: Offset.zero, spreadRadius: 5)]),
            ),
          ),
          ScrollConfiguration(
            behavior: AppScrollBehavior(),
            child: Transform.scale(
              scale: 1.3,
              alignment: Alignment.bottomCenter,
              child: PageView.builder(
                controller: _pageController,
                itemCount: foods.length + 1,
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  if (value < foods.length) {
                    _pageTextController.animateToPage(value, duration: _duration, curve: Curves.easeOut);
                  }
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox.shrink();
                  }
                  final food = foods[index - 1];
                  final result = _currentPage - index + 1;
                  // print("_currentPage: ${_currentPage} - index: ${index} +1 = ${result}");
                  final value = -0.3 * result + 1;
                  final opacityValue = value.clamp(0.0, 1.0);

                  // print("height/3: ${MediaQuery.of(context).size.height / 3} - (1 - value): ${(1 - value).abs()}");
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0001)
                        ..translate(
                          0.0,
                          getDeviceSize(context).height / 2.3 * (1 - value).abs(),
                        )
                        ..scale(value),
                      child: Opacity(
                          opacity: opacityValue,
                          child: Hero(
                            tag: food.name,
                            child: Image.asset(
                              food.imagePath,
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: 100,
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageTextController,
                        itemCount: foods.length ,
                        itemBuilder: (context, index) {
                          print("index ${index} - _textPage : ${_textPage}");
                          final opacity = (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
                          print("opacity ${opacity}  ");

                          return Opacity(
                              opacity: opacity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: getDeviceSize(context).width * 0.2),
                                child: Text(
                                  foods[index].name,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ));
                        },
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  AnimatedSwitcher(
                    duration: _duration,
                    child: Text(
                      _currentPage==foods.length?"":
                      '\$${foods[_currentPage.toInt()].price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
