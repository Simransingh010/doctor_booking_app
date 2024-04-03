import 'package:doctor_booking_app/Screens/buy_medicine.dart';
import 'package:doctor_booking_app/Screens/doctor_data.dart';
// import 'package:doctor_booking_app/Screens/map_screen.dart';
import 'package:doctor_booking_app/Screens/medicine_data.dart';
import 'package:doctor_booking_app/Screens/vc_appointment.dart';

import 'Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        BookingScreen.routeName: (context) => const BookingScreen(),
        MedicineScreen.routeName: (context) => const MedicineScreen(),
        MedicineDataScreen.routeName: (context) => const MedicineDataScreen(),
        VcBookingScreen.routeName: (context) => const VcBookingScreen(),
      },
    );
  }
}
