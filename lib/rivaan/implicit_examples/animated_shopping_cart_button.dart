import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => isActive = !isActive),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            // width: isActive ? 180 : 80,
            width: 180,
            height: 60.0,
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isActive ? 30 : 10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isActive ? Icons.check : Icons.shopping_cart,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Added to Cart'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
