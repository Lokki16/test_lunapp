import 'package:flutter/material.dart';

class TriangleClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipperRight oldClipper) => false;
}
