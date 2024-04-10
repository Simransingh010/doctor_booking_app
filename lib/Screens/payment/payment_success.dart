import 'dart:async';

import 'package:doctor_booking_app/Screens/payment/cart_order_done.dart';
import 'package:doctor_booking_app/Screens/payment/clinic_booking_done.dart';
import 'package:doctor_booking_app/Screens/payment/payment_origin.dart';
import 'package:doctor_booking_app/Screens/payment/vc_booking_done.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen1 extends StatelessWidget {
  final PaymentOrigin origin;

  const SplashScreen1(this.origin, {super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      switch (origin) {
        case PaymentOrigin.BookingScreen:
          print('booking screen called');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ClinicBookingDoneScreen(),
            ),
          );
          break;
        case PaymentOrigin.VcBookingScreen:
          print('vc screen called');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const VCBookingDoneScreen(),
            ),
          );
          break;
        case PaymentOrigin.CartScreen:
          print('cart screen called');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CartOrderDoneScreen(),
            ),
          );
          break;
      }
    });
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
