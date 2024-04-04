import 'package:doctor_booking_app/Screens/booked.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentSplashScreen extends StatefulWidget {
  const PaymentSplashScreen({super.key});

  @override
  State<PaymentSplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<PaymentSplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DoctorBookedScreen()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Please Wait while Your Transaction is being Processed..',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CircularProgressIndicator(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
