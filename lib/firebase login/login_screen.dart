import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_booking_app/Screens/home_screen.dart';
import 'package:doctor_booking_app/firebase%20login/auth_services.dart';
import 'package:doctor_booking_app/firebase%20login/signup.dart';
import 'package:doctor_booking_app/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Column(
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
                  CustomTextField(
                    hint: "Enter Email",
                    label: "Email",
                    controller: _email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hint: "Enter Password",
                    label: "Password",
                    controller: _password,
                    isPassword: true,
                  ),
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromWidth(350),
                            minimumSize: const Size.fromHeight(40),
                            backgroundColor:
                                const Color.fromARGB(255, 41, 50, 140),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()),
                          );
                        },
                        child: const Text('Signup',
                            style: TextStyle(color: Colors.red)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final user = await _auth.loginUserWithEmailAndPassword(
          _email.text, _password.text);
      if (user != null) {
        log("User Logged In");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful')),
        );
        goToHome(context);
      } else {
        setState(() {
          _errorMessage = 'Password wrong, please try again';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Password wrong, please try again';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
        height: MediaQuery.of(context).size.height * 0.47,
        enableInfiniteScroll: true,
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
              height: MediaQuery.of(context).size.height * 0.23,
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
              height: MediaQuery.of(context).size.height * 0.23,
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
              height: MediaQuery.of(context).size.height * 0.23,
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
              height: MediaQuery.of(context).size.height * 0.23,
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

goToSignup(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupScreen()),
    );

goToHome(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    this.controller,
    this.isPassword = false,
  });
  final String hint;
  final String label;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          label: Text(label),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey, width: 1))),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
  });
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 180,
        height: 42,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(fontSize: 18),
            )));
  }
}
