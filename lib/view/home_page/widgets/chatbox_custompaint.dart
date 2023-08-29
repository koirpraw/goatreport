import 'dart:ui' as ui;
import 'package:flutter/material.dart';
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.4166667,size.height*0.4600000);
    path0.quadraticBezierTo(size.width*0.4166833,size.height*0.4313857,size.width*0.4400000,size.height*0.4285714);
    path0.lineTo(size.width*0.5808333,size.height*0.4285714);
    path0.quadraticBezierTo(size.width*0.5892167,size.height*0.3894714,size.width*0.6022833,size.height*0.3849143);
    path0.quadraticBezierTo(size.width*0.6142417,size.height*0.3847714,size.width*0.6250000,size.height*0.4271429);
    path0.quadraticBezierTo(size.width*0.7219833,size.height*0.4291286,size.width*0.7500000,size.height*0.4271429);
    path0.quadraticBezierTo(size.width*0.7682333,size.height*0.4273000,size.width*0.7691667,size.height*0.4614286);
    path0.quadraticBezierTo(size.width*0.7680750,size.height*0.5365143,size.width*0.7675000,size.height*0.5400000);
    path0.quadraticBezierTo(size.width*0.7669750,size.height*0.5742857,size.width*0.7491667,size.height*0.5714286);
    path0.quadraticBezierTo(size.width*0.5191667,size.height*0.5703571,size.width*0.4425000,size.height*0.5700000);
    path0.quadraticBezierTo(size.width*0.4177917,size.height*0.5703571,size.width*0.4166667,size.height*0.5400000);
    path0.quadraticBezierTo(size.width*0.4166667,size.height*0.5200000,size.width*0.4166667,size.height*0.4600000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


