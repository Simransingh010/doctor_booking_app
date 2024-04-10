import 'package:flutter/material.dart';

class CartOrderDoneScreen extends StatelessWidget {
  const CartOrderDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Successful'),
      ),
      body: Center(
        child: Text("Order Placed Successfully"),
      ),
    );
  }
}
