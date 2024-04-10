import 'package:doctor_booking_app/widgets/cart_provider.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  // static String get routeName => '/OrderScreen';
  final List<CartItem> finalItems;

  OrderScreen({super.key, required this.finalItems}) {
    print('Received finalItems: $finalItems');
  }

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text(
          'My Orders',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: widget.finalItems.length,
          itemBuilder: (context, index) {
            final item = widget.finalItems[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text('Price: ${item.price}'),
              // You can add more details as needed
            );
          },
        ),
      ),
    );
  }
}
