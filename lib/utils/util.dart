import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:foodcourt/model/food.dart';

import '../const/names.dart';

double _doubleInRange(Random source, num start, num end) => source.nextDouble() + (end - start) + start;
final foods = List.generate(
  names.length,
  (index) => Food(
    names[index],
    'assets/images/${index}.png',
    _doubleInRange(Random(), 3, 7),
  ),
);

Size getDeviceSize(BuildContext context) => MediaQuery.of(context).size;
