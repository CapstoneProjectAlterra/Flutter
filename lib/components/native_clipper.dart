import 'package:flutter/material.dart';

class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 100);
    path.quadraticBezierTo(size.width / 3, 15, size.width / 2, 20);
    path.quadraticBezierTo(size.width - size.width / 3, 15, size.width, 100);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
