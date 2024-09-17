import 'dart:async';
import 'package:doctor_booking_app/Screens/payment/clinic_booking_done.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ClinicBookingDoneScreen(),
          ));
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
