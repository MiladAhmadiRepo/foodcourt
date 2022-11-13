import 'dart:math';

import 'package:foodcourt/model/food.dart';

import '../data/names.dart';

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() + (end - start) + start;
final foods = List.generate(
  names.length,
  (index) => Food(
    names[index],
    'assets/images/${index}.png',
    _doubleInRange(Random(), 3, 7),
  ),
);