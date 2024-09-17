import 'package:doctor_booking_app/Screens/News_Screens/newsScreen.dart';
import 'package:doctor_booking_app/Screens/buy_medicine/buy_medicine.dart';
import 'package:doctor_booking_app/Screens/clinic_consult/book_doctor.dart';
import 'package:doctor_booking_app/Screens/clinic_consult/doctor_data.dart';
import 'package:doctor_booking_app/Screens/buy_medicine/medicine_data.dart';
import 'package:doctor_booking_app/Screens/News_Screens/news_article.dart';
import 'package:doctor_booking_app/Screens/home_screen.dart';
import 'package:doctor_booking_app/Screens/video_consult/book_vc.dart';
import 'package:doctor_booking_app/Screens/video_consult/vc_appointment.dart';
import 'package:doctor_booking_app/firebase_options.dart';
import 'package:doctor_booking_app/widgets/cart_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
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
          NewsArticle.routeName: (context) => const NewsArticle(),
          NewsScreen.routeName: (context) => const NewsScreen(),
          DoctorScreen.routeName: (context) => const DoctorScreen(),
          DoctorCallScreen.routeName: (context) => const DoctorCallScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
