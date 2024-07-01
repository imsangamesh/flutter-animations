import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MyPaintCanvas extends StatelessWidget {
  const MyPaintCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Paint")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Points
              Container(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(bottom: 50),
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: MyPointsPainter(),
                ),
              ),
              // Gradient
              Container(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(bottom: 50),
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: MyGradientPainter(),
                ),
              ),
              // DRRect
              Container(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(bottom: 50),
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: MyDRRectPainter(),
                ),
              ),
              // RRect
              Container(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(bottom: 50),
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: MyRRectPainter(),
                ),
              ),
              // Oval
              Container(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(bottom: 50),
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: MyOvalPainter(),
                ),
              ),
              // Rect
              Container(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(bottom: 50),
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: MyRectPainter(),
                ),
              ),
              // Circle
              Container(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(bottom: 50),
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: MyCirclePainter(),
                ),
              ),
              // Line
              Container(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.only(bottom: 50),
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: MyLinePainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPointsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    // ----------------------- 1: with Offset points
    // final points = <Offset>[
    //   const Offset(10, 10),
    //   const Offset(250, 10),
    //   Offset(size.width / 2, size.height / 2),
    //   const Offset(150, 100),
    //   const Offset(10, 10),
    // ];
    // canvas.drawPoints(ui.PointMode.polygon, points, paint);

    // ----------------------- 2: with FLoat32 points
    final points = Float32List.fromList([10, 10, 100, 100, 200, 100, 200, 200]);
    // canvas.drawRawPoints(ui.PointMode.points, points, paint);
    canvas.drawRawPoints(ui.PointMode.polygon, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        [Colors.pink, Colors.purple.shade100],
        [0.1, 0.9],
      );

    // creating a Rect from 0,0 to full_size
    canvas.clipRect(Offset.zero & size);
    canvas.drawPaint(paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyDRRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.pink
      ..style = PaintingStyle.fill;

    const bigRect = Rect.fromLTRB(10, 20, 100, 200);
    const smallRect = Rect.fromLTRB(10, 20, 80, 160);

    final bigRRect = RRect.fromRectXY(bigRect, 20, 20);
    final smallRRect = RRect.fromRectXY(smallRect, 20, 20);

    canvas.drawDRRect(bigRRect, smallRRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyRRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(
      // RRect.fromRectAndRadius(
      //   const Rect.fromLTRB(10, 20, 100, 200),
      //   const Radius.circular(16),
      // ),

      // RRect.fromRectXY(const Rect.fromLTRB(10, 20, 100, 200), 50, 25),

      RRect.fromRectAndCorners(
        const Rect.fromLTRB(10, 20, 100, 200),
        topLeft: const Radius.circular(100),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyOvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(100, 100),
        width: 150,
        height: 100,
      ),

      // Rect.fromCircle(center: const Offset(100, 100), radius: 50),

      // const Rect.fromLTWH(10, 10, 100, 200),

      // Rect.fromPoints(const Offset(10, 10), const Offset(90, 90)),

      // const Rect.fromLTRB(10, 10, 100, 150),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.pink;

    canvas.drawRect(
      // Rect.fromCenter(
      //   center: const Offset(100, 100),
      //   width: 150,
      //   height: 100,
      // ),

      // Rect.fromCircle(center: const Offset(100, 100), radius: 50),

      // const Rect.fromLTWH(10, 10, 100, 200),

      // Rect.fromPoints(const Offset(10, 10), const Offset(90, 90)),

      const Rect.fromLTRB(10, 10, 100, 150),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.pink;
    // ..style = PaintingStyle.stroke;

    canvas.drawCircle(const Offset(100, 100), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.pink;

    canvas.drawLine(Offset.zero, Offset(size.width, 100), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
