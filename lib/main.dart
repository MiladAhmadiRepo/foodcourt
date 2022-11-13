import 'package:flutter/material.dart';
import 'package:foodcourt/utils/ScrollClass.dart';
import 'package:foodcourt/utils/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: 'FoodCourt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentPage=0;
  PageController _pageController=PageController(
    viewportFraction: 0.3
  );

  void _foodControllerListener(){
      setState(() {
        _currentPage=_pageController.page!;
      });
  }

  @override
  void initState() {
    _pageController.addListener(_foodControllerListener);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.removeListener(_foodControllerListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: 100,
              child: Container(
                color: Colors.red,
              )),
          PageView.builder(
            controller: _pageController,
            itemCount: foods.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
            final food=foods[index];
            return Image.asset(food.imagePath);
          },)
        ],
      ),
    );
  }
}
