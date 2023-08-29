import 'package:flutter/material.dart';


class PromptBoxCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size,) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9993065,size.height*0.2918078);
    path_0.lineTo(size.width*0.9993065,size.height*0.8694807);
    path_0.cubicTo(size.width*0.9993065,size.height*0.9400167,size.width*0.9850208,size.height*0.9971675,size.width*0.9674202,size.height*0.9971675);
    path_0.lineTo(size.width*0.03257975,size.height*0.9971675);
    path_0.cubicTo(size.width*0.01496533,size.height*0.9971675,size.width*0.0006934813,size.height*0.9399611,size.width*0.0006934813,size.height*0.8694807);
    path_0.lineTo(size.width*0.0006934813,size.height*0.2918078);
    path_0.cubicTo(size.width*0.0006934813,size.height*0.2212719,size.width*0.01497920,size.height*0.1641211,size.width*0.03257975,size.height*0.1641211);
    path_0.lineTo(size.width*0.4333010,size.height*0.1641211);
    path_0.cubicTo(size.width*0.4417614,size.height*0.1641211,size.width*0.4498752,size.height*0.1506804,size.width*0.4558530,size.height*0.1266870);
    path_0.lineTo(size.width*0.4774619,size.height*0.04015551);
    path_0.cubicTo(size.width*0.4899168,size.height*-0.009719522,size.width*0.5101110,size.height*-0.009719522,size.width*0.5225659,size.height*0.04015551);
    path_0.lineTo(size.width*0.5441748,size.height*0.1266870);
    path_0.cubicTo(size.width*0.5501526,size.height*0.1506248,size.width*0.5582663,size.height*0.1641211,size.width*0.5667268,size.height*0.1641211);
    path_0.lineTo(size.width*0.9674341,size.height*0.1641211);
    path_0.cubicTo(size.width*0.9850485,size.height*0.1641211,size.width*0.9993204,size.height*0.2213274,size.width*0.9993204,size.height*0.2918078);
    path_0.close();

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_0_stroke.color=Color(0xff0000ff).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_stroke);


    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ShadowPromptBox extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.8214286,size.height*0.3386266);
    path_0.lineTo(size.width*0.8214286,size.height*0.7850215);
    path_0.cubicTo(size.width*0.8214286,size.height*0.8395279,size.width*0.8112103,size.height*0.8836910,size.width*0.7986210,size.height*0.8836910);
    path_0.lineTo(size.width*0.1299504,size.height*0.8836910);
    path_0.cubicTo(size.width*0.1173512,size.height*0.8836910,size.width*0.1071429,size.height*0.8394850,size.width*0.1071429,size.height*0.7850215);
    path_0.lineTo(size.width*0.1071429,size.height*0.3386266);
    path_0.cubicTo(size.width*0.1071429,size.height*0.2841202,size.width*0.1173611,size.height*0.2399571,size.width*0.1299504,size.height*0.2399571);
    path_0.lineTo(size.width*0.4165774,size.height*0.2399571);
    path_0.cubicTo(size.width*0.4226290,size.height*0.2399571,size.width*0.4284325,size.height*0.2295708,size.width*0.4327083,size.height*0.2110300);
    path_0.lineTo(size.width*0.4481647,size.height*0.1441631);
    path_0.cubicTo(size.width*0.4570734,size.height*0.1056223,size.width*0.4715179,size.height*0.1056223,size.width*0.4804266,size.height*0.1441631);
    path_0.lineTo(size.width*0.4958829,size.height*0.2110300);
    path_0.cubicTo(size.width*0.5001587,size.height*0.2295279,size.width*0.5059623,size.height*0.2399571,size.width*0.5120139,size.height*0.2399571);
    path_0.lineTo(size.width*0.7986310,size.height*0.2399571);
    path_0.cubicTo(size.width*0.8112302,size.height*0.2399571,size.width*0.8214385,size.height*0.2841631,size.width*0.8214385,size.height*0.3386266);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PromptBoxLarge extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.8211994,size.height*0.3390461);
    path_0.lineTo(size.width*0.8211994,size.height*0.7860197);
    path_0.cubicTo(size.width*0.8211994,size.height*0.8405921,size.width*0.8109902,size.height*0.8848355,size.width*0.7983961,size.height*0.8848355);
    path_0.lineTo(size.width*0.1299163,size.height*0.8848355);
    path_0.cubicTo(size.width*0.1173222,size.height*0.8848355,size.width*0.1071130,size.height*0.8405921,size.width*0.1071130,size.height*0.7860197);
    path_0.lineTo(size.width*0.1071130,size.height*0.3390461);
    path_0.cubicTo(size.width*0.1071130,size.height*0.2844737,size.width*0.1173222,size.height*0.2402303,size.width*0.1299163,size.height*0.2402303);
    path_0.lineTo(size.width*0.4164505,size.height*0.2402303);
    path_0.cubicTo(size.width*0.4224965,size.height*0.2402303,size.width*0.4282985,size.height*0.2298355,size.width*0.4325802,size.height*0.2112829);
    path_0.lineTo(size.width*0.4480265,size.height*0.1443421);
    path_0.cubicTo(size.width*0.4569317,size.height*0.1057566,size.width*0.4713738,size.height*0.1057566,size.width*0.4802789,size.height*0.1443421);
    path_0.lineTo(size.width*0.4957252,size.height*0.2112829);
    path_0.cubicTo(size.width*0.5000000,size.height*0.2298026,size.width*0.5058020,size.height*0.2402303,size.width*0.5118550,size.height*0.2402303);
    path_0.lineTo(size.width*0.7983891,size.height*0.2402303);
    path_0.cubicTo(size.width*0.8109833,size.height*0.2402303,size.width*0.8211925,size.height*0.2844737,size.width*0.8211925,size.height*0.3390461);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}