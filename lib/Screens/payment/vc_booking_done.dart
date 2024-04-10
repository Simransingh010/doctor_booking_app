import 'package:flutter/material.dart';

class VCBookingDoneScreen extends StatelessWidget {
  const VCBookingDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vc Booking Successful'),
      ),
      body: Center(
        child: Text("video Booking Done Successfully"),
      ),
    );
  }
}
