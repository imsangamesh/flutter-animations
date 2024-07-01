import 'dart:math';

import 'package:flutter/material.dart';

class Animation6 extends StatefulWidget {
  const Animation6({super.key});

  @override
  State<Animation6> createState() => _Animation6State();
}

class _Animation6State extends State<Animation6> {
  Color color = genRandomColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Animation 6')),
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: TweenAnimationBuilder(
            duration: const Duration(seconds: 1),
            tween: ColorTween(begin: genRandomColor, end: genRandomColor),
            builder: (context, value, child) {
              return Container(
                width: size.width,
                height: size.width,
                color: value,
              );
            },
            onEnd: () => setState(() => color = genRandomColor),
          ),
        ),
      ),
    );
  }
}

final random = Random();
Color get genRandomColor => Color(0xff000000 + random.nextInt(0xffffffff));

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();

  @override
  Path getClip(Size size) {
    var path = Path();
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    path.addOval(rect);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
