import 'package:flutter/material.dart';

class CustomCurvedWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    final firstCurve = Offset(size.width, size.height);
    final lastCurve = Offset(size.height / 2, size.height - 30);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    // final thirdFirstCurve = Offset(size.width / 2, size.height / 3);
    // final thirdlastCurve = Offset(size.height + 100, size.width / 3);
    // path.quadraticBezierTo(
    //   thirdFirstCurve.dx,
    //   thirdFirstCurve.dy,
    //   thirdlastCurve.dx,
    //   thirdlastCurve.dy,
    // );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
