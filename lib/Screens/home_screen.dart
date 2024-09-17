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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: Drawers(tiles: DrawerTile.tiles),
      appBar: _buildAppBar(context),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: _buildBody(context),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.blue.shade800],
          ),
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: _buildAppBarTitle(context),
      actions: _buildAppBarActions(context),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: _buildSearchBar(context),
      ),
    );
  }

  Widget _buildAppBarTitle(BuildContext context) {
    return FutureBuilder<String>(
      future: _getCurrentLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(color: Colors.white);
        } else if (snapshot.hasError) {
          return const Text('Location unavailable',
              style: TextStyle(color: Colors.white));
        } else {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 20),
              const SizedBox(width: 4),
              Text(
                snapshot.data ?? 'Unknown Location',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.newspaper_outlined, color: Colors.white),
        onPressed: () => _navigateTo(context, const NewsScreen()),
      ),
      IconButton(
        icon: const Icon(Icons.wallet, color: Colors.white),
        onPressed: () {
          // Handle wallet action
        },
      ),
      IconButton(
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () => _navigateTo(context, CartScreen()),
      ),
    ];
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        style: GoogleFonts.lato(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          hintText: 'Search doctors, clinics, hospitals...',
          hintStyle: GoogleFonts.lato(fontSize: 16, color: Colors.black54),
          prefixIcon: const Icon(Icons.search, color: Colors.blue),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Future<String> _getCurrentLocation() async {
    // Implement location fetching logic here
    // For demonstration, we'll return a mock location
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating network delay
    return 'New York, NY';
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildServiceCards(context),
          const SizedBox(height: 20),
          _buildFeaturedService(context),
          const SizedBox(height: 20),
          _buildServicesRow(context),
          const SizedBox(height: 20),
          Divider(height: 20, thickness: 8, color: Colors.grey[300]),
          const SizedBox(height: 20),
          _buildBestOffersCarousel(context),
          const SizedBox(height: 20),
          _buildSymptomsSection(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildServiceCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCard(
            context,
            'Book Appointment',
            'Confirmed Appointments',
            'https://merriam-webster.com/assets/mw/images/article/art-wap-article-main/alt-5d4c7e7746fb1-6705-68b432d17a9a6f2e77528cfff3a63a82@1x.jpg',
            DoctorScreen(),
          ),
          _buildCard(
            context,
            'Instant Video Consult',
            'Connect Within 60 Seconds',
            'https://shorturl.at/psxK4',
            DoctorCallScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String subtitle,
      String imageUrl, Widget screen) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () => _navigateTo(context, screen),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.28, // Increased height
          width: MediaQuery.of(context).size.width * 0.45, // Increased width
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Added for even spacing
            children: [
              ImageContainer(
                  padding: EdgeInsets.zero, imageUrl: imageUrl, width: 170),
              const SizedBox(height: 15), // Increased spacing
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.center, // Center align text
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    color: Colors.grey),
                textAlign: TextAlign.center, // Center align text
              ),
              const SizedBox(height: 10), // Added bottom spacing
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
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
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
        _buildServiceImage(
            context, 'assets/Images/consultdoc.jpeg', const DoctorScreen()),
        _buildServiceImage(
            context, 'assets/Images/insurance.jpeg', const InsuranceScreen()),
      ],
    );
  }

  Widget _buildServiceImage(
      BuildContext context, String imagePath, Widget screen) {
    return InkWell(
      onTap: () => _navigateTo(context, screen),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.48, // Increased width
        height: MediaQuery.of(context).size.height * 0.35, // Increased height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover, // Changed to cover to fill the whole container
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  imagePath.contains('consultdoc')
                      ? 'Connect\nwith doctors\nin 2 mins'
                      : 'Insure\nyour family',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  imagePath.contains('consultdoc')
                      ? 'Experts available 24/7'
                      : 'Explore India\'s\nbest health plans.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSymptomsSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55, // Increased height
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
          Expanded(
            child: SymptomsGrid(symptom: Symptoms.symptom),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => _navigateTo(context, const AllSymptomScreen()),
              child: const Text(
                'View All Symptoms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBestOffersCarousel(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.36,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 41, 50, 140),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.percent,
                      color: Color.fromARGB(255, 41, 50, 140)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Best Offers',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Explore Deals, Offers, Health Updates and More',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CarouselSlider(
              items: [
                _buildCarouselItem('assets/Images/ad1.jpeg'),
                _buildCarouselItem('assets/Images/ad2.jpeg'),
              ],
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                height: 180,
                viewportFraction: 0.85,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.help),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChatGemini();
          },
        );
      },
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
