
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{
  Color color;
  RPSCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = color.withAlpha(180)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(0,size.height*0.2842857);
    path0.lineTo(size.width*0.0020000,size.height*0.0000000);
    path0.lineTo(size.width*0.3034600,size.height*0.0000000);
    path0.lineTo(size.width*0.3020000,size.height*0.2828571);
    path0.lineTo(size.width*0.1480000,size.height*0.1842857);
    path0.lineTo(0,size.height*0.2842857);
    path0.close();

    canvas.drawPath(path0, paint0);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
