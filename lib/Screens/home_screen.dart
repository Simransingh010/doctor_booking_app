import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_booking_app/Screens/book_doctor.dart';
import 'package:doctor_booking_app/Screens/book_vc.dart';
import 'package:doctor_booking_app/Screens/buy_medicine.dart';
import 'package:doctor_booking_app/Screens/lab_test.dart';
import 'package:doctor_booking_app/Screens/newsScreen.dart';
import 'package:doctor_booking_app/models/drawer_model.dart';
import 'package:doctor_booking_app/models/symptoms.dart';
import 'package:doctor_booking_app/pages/chat_gemini.dart';
import 'package:doctor_booking_app/widgets/drawer.dart';
import 'package:doctor_booking_app/widgets/image_container.dart';
import 'package:doctor_booking_app/widgets/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: Drawers(
        tiles: DrawerTile.tiles,
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight * 2),
        child: Column(
          children: [
            AppBar(
              // toolbarHeight: 150,
              titleSpacing: 0,
              centerTitle: false,
              leading: Builder(
                builder: (context) => IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Image.asset("assets/Images/profileIcon.png"),
                ),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.gps_fixed,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Jalandhar',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, right: 15),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChatGemini(),
                                ));
                          },
                          child: const Icon(
                            Icons.health_and_safety_sharp,
                            size: 28,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewsScreen(),
                                ));
                          },
                          child: const Icon(
                            Icons.newspaper_outlined,
                            size: 28,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.wallet,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.06,
              child: Card(
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 2,
                child: TextField(
                  maxLength: null,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  // keyboardType: TextInputType.emailAddress,
                  obscureText: false,

                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 5),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search for Doctors, Clinics & Hospitals',
                    hintStyle: GoogleFonts.lato(fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Divider(
              height: 0,
              thickness: 0,
              color: Colors.grey,
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Column(
                        children: [
                          ImageContainer(
                              padding: EdgeInsets.zero,
                              imageUrl: 'https://shorturl.at/fqQ18',
                              width: 170),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Book Appointment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Confirmed Appointments',
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                Card(
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorCallScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Column(
                        children: [
                          ImageContainer(
                            padding: EdgeInsets.zero,
                            imageUrl: 'https://shorturl.at/psxK4',
                            width: 170,
                            borderRadius: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 13,
                              left: 6,
                              right: 6,
                            ),
                            child: Text(
                              'Instant Video Consult',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Text(
                            'Connect With 60 Seconds',
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedicineScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.095,
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: const Row(
                        children: [
                          ImageContainer(
                            padding: EdgeInsets.zero,
                            imageUrl: 'https://shorturl.at/atxU9',
                            width: 70,
                            height: 100,
                            borderRadius: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Medicines',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Essential at \n your Doorstep',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LabTestScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height * 0.095,
                        width: MediaQuery.of(context).size.width * 0.44,
                        child: const Row(
                          children: [
                            ImageContainer(
                              padding: EdgeInsets.zero,
                              imageUrl: 'https://shorturl.at/moK25',
                              width: 70,
                              height: 100,
                              borderRadius: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lab Tests',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Sample Pickup at \n your Home',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.stars,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Featured Service',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/Images/diabetes.png'),
                        fit: BoxFit.contain)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/Images/consultdoc.jpeg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/Images/insurance.jpeg'),
                        fit: BoxFit.contain)),
              ),
            ],
          ),
          Divider(
            height: 20,
            thickness: 8,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.48,
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(
                    Icons.video_camera_front_rounded,
                  ),
                  title: Text("Not Feeling too Well?"),
                  subtitle: Text(
                    'Treat Common symptoms with Top Specialist',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SymptomsGrid(
                  symptom: Symptoms.symptom,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size.fromWidth(350),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {},
                    child: const Text(
                      'View All Symptoms',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            color: const Color.fromARGB(255, 41, 50, 140),
            child: Column(
              children: [
                const ListTile(
                  leading: CircleAvatar(
                      child: Icon(
                    Icons.percent,
                  )),
                  title: Text(
                    'Best Offers',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Explore Deals, offers, health Updates and More',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CarouselSlider(
                  items: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/Images/ad1.jpeg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/Images/ad2.jpeg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    enlargeCenterPage: false,
                    autoPlayCurve: Curves.decelerate,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    height: 180,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
