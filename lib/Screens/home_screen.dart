import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_booking_app/Screens/all_symptoms_screen.dart';
import 'package:doctor_booking_app/Screens/cart_screen.dart';
import 'package:doctor_booking_app/Screens/clinic_consult/book_doctor.dart';
import 'package:doctor_booking_app/Screens/insurance/insurance_screen.dart';
import 'package:doctor_booking_app/Screens/video_consult/book_vc.dart';
import 'package:doctor_booking_app/Screens/buy_medicine/buy_medicine.dart';
import 'package:doctor_booking_app/Screens/lab_test.dart';
import 'package:doctor_booking_app/Screens/News_Screens/newsScreen.dart';
import 'package:doctor_booking_app/models/drawer_model.dart';
import 'package:doctor_booking_app/models/symptoms.dart';
import 'package:doctor_booking_app/Screens/chat_gemini.dart';
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
        preferredSize: const Size.fromHeight(kToolbarHeight * 2.2),
        child: Column(
          children: [
            AppBar(
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
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.newspaper_outlined, size: 28),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsScreen()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.wallet, size: 28),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart, size: 28),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        ),
                      ),
                    ],
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
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 5),
                    prefixIcon:
                        const Icon(Icons.search, size: 30, color: Colors.black),
                    border: InputBorder.none,
                    hintText: 'Search for Doctors, Clinics & Hospitals',
                    hintStyle: GoogleFonts.lato(fontSize: 14),
                  ),
                ),
              ),
            ),
            const Divider(height: 0, thickness: 0, color: Colors.grey),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCard(
                      context,
                      'Book Appointment',
                      'Confirmed Appointments',
                      'https://shorturl.at/fqQ18',
                      DoctorScreen()),
                  _buildCard(
                      context,
                      'Instant Video Consult',
                      'Connect Within 60 Seconds',
                      'https://shorturl.at/psxK4',
                      DoctorCallScreen()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHorizontalCard(
                      context,
                      'Medicines',
                      'Essential at your Doorstep',
                      'https://shorturl.at/atxU9',
                      MedicineScreen()),
                  _buildHorizontalCard(
                      context,
                      'Lab Tests',
                      'Sample Pickup at your Home',
                      'https://shorturl.at/moK25',
                      LabTestScreen()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildFeaturedService(context),
            const SizedBox(height: 20),
            _buildServicesRow(context),
            const SizedBox(height: 20),
            Divider(height: 20, thickness: 8, color: Colors.grey[300]),
            _buildSymptomsSection(context),
            _buildBestOffersCarousel(context),
            const SizedBox(height: 200),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        child: Icon(Icons.help),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ChatGemini();
            },
          );
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String subtitle,
      String imageUrl, Widget screen) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              ImageContainer(
                  padding: EdgeInsets.zero, imageUrl: imageUrl, width: 170),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalCard(BuildContext context, String title,
      String subtitle, String imageUrl, Widget screen) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.43,
          child: Row(
            children: [
              ImageContainer(
                  padding: EdgeInsets.zero,
                  imageUrl: imageUrl,
                  width: 65,
                  height: 100,
                  borderRadius: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        subtitle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedService(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.stars, size: 30, color: Colors.black),
              SizedBox(width: 10),
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
              fit: BoxFit
                  .cover, // Use BoxFit.cover to ensure the image covers the entire container
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServicesRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DoctorScreen()),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/Images/consultdoc.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InsuranceScreen()),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/Images/insurance.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSymptomsSection(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.video_camera_front_rounded),
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
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllSymptomScreen())),
              child: const Text(
                'View All Symptoms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildBestOffersCarousel(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.36,
      color: const Color.fromARGB(255, 41, 50, 140),
      child: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.percent)),
            title: Text(
              'Best Offers',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Explore Deals, offers, health Updates and More',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          CarouselSlider(
            items: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/Images/ad1.jpeg'),
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
                      image: AssetImage('assets/Images/ad2.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
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
    );
  }
}