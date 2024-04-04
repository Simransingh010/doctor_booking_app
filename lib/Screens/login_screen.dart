import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_booking_app/Screens/home_screen.dart';
import 'package:doctor_booking_app/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 50, 140),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[300],
              radius: 10,
            ),
            Text(
              'HealthMate',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue[300],
              radius: 10,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 41, 50, 140),
            child: LoginCarousel(loginData: CarouselLogin.loginData),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 41, 50, 140),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 4,
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 3,
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 3,
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 3,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TextField(
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    hintText: 'Enter Your Email',
                    hintStyle: GoogleFonts.lato(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
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
                      Icons.password,
                      size: 30,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.lato(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(350),
                      minimumSize: const Size.fromHeight(40),
                      backgroundColor: const Color.fromARGB(255, 41, 50, 140)),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginCarousel extends StatelessWidget {
  const LoginCarousel({
    required this.loginData,
    super.key,
  });
  final List<CarouselLogin> loginData;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        height: MediaQuery.of(context).size.height * 0.5,
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
      ),
      items: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(loginData[0].iconUrl),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                loginData[0].text2,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(loginData[1].iconUrl),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                loginData[1].text2,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(loginData[2].iconUrl),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                loginData[2].text2,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(loginData[3].iconUrl),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                loginData[3].text2,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
