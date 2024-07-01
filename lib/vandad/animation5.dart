import 'package:flutter/material.dart';

class Animation5 extends StatefulWidget {
  const Animation5({super.key});

  @override
  State<Animation5> createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> {
  bool _isZoomedIn = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation 5'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => _isZoomedIn = !_isZoomedIn);
            },
            child: Text(_isZoomedIn ? 'Zoom out' : 'Zoom in'),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 1),
              width: _isZoomedIn ? size.width : 200,
              child: Image.asset('assets/image.png'),
            ),
          ),
        ],
      ),
    );
  }
}
