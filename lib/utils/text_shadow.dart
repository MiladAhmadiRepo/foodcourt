import 'dart:ui';

import 'package:flutter/material.dart';

class GlowWidget extends StatelessWidget {
  final child;
  final offset;
  final sigma;
  final opacity;
  final color;
  const GlowWidget({Key? key, this.child, this.offset, this.sigma, this.opacity, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Stack(
     alignment: Alignment.center,
     children: <Widget>[
       Transform.translate(
         offset: offset,
         child: ImageFiltered(
           imageFilter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
           child: Container(
             decoration: BoxDecoration(
               border: Border.all(
                 color: Colors.transparent,
                 width: 0,
               ),
             ),
             child: Opacity(
               opacity: opacity,
               child: ColorFiltered(
                 colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                 child: child,
               ),
             ),
           ),
         ),
       ),
       child,
     ],
   );
  }
}
