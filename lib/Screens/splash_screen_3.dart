import 'dart:async';
import 'package:doctor_booking_app/Screens/orders.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:doctor_booking_app/widgets/cart_provider.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key, required this.finalItems});

  final List<CartItem> finalItems;

  @override
  _SplashScreen3State createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  void initState() {
    super.initState();
    print('Received simran: ${widget.finalItems}');

    // Start a timer to navigate to the next screen after 3 seconds
    Timer(Duration(seconds: 3), navigateToNextScreen);
  }

  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OrderScreen(
          finalItems: widget.finalItems,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset('assets/Images/paymentsucess.json'),
        ),
      ),
    );
  }
}
