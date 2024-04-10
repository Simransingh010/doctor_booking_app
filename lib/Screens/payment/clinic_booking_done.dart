import 'package:flutter/material.dart';

class ClinicBookingDoneScreen extends StatelessWidget {
  const ClinicBookingDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Successful'),
      ),
      body: Center(
        child: Text("Booking Done Successfully"),
      ),
    );
  }
}
