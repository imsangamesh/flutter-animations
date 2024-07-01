import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});
  final double size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: size),
          duration: const Duration(seconds: 5),
          builder: (context, val, child) {
            return Container(
              width: val,
              height: val,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: val,
                    spreadRadius: val / 2,
                  ),
                ],
              ),
              child: Center(child: child),
            );
          },
          child: const Text('This is not rebuilding!'),
        ),
      ),
    );
  }
}
