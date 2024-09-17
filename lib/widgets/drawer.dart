import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking_app/Screens/appointment_screen.dart';
import 'package:doctor_booking_app/firebase%20login/auth_services.dart';
import 'package:doctor_booking_app/firebase%20login/login_screen.dart';
import 'package:doctor_booking_app/models/drawer_model.dart';
import 'package:doctor_booking_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drawers extends StatefulWidget {
  Drawers({
    required this.tiles,
    super.key,
  });
  final List<DrawerTile> tiles;

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  final currentUser = FirebaseAuth.instance.currentUser;
  late Stream<UserModel2> userStream;
  final auth = AuthService();
  bool _isLoggingOut = false;

  @override
  void initState() {
    userStream = fetchUserData();
    super.initState();
  }

  Stream<UserModel2> fetchUserData() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .snapshots()
        .map((doc) {
      if (doc.exists && doc.data() != null) {
        return UserModel2.fromMap(doc.data()! as Map<String, dynamic>);
      } else {
        log('HEHE');
        throw Exception('User data not available');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        children: [
          StreamBuilder<UserModel2>(
            stream: userStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  final UserModel2? user = snapshot.data;
                  if (user != null) {
                    return ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Image.asset(
                          "assets/Images/profileIcon.png",
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "${user.FullName}",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                      subtitle: Text(
                        'View and Edit Profile',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              color: Colors.blue,
                            ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
              return CircularProgressIndicator();
            },
          ),
          const Divider(
            thickness: 0,
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.77,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.tiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (widget.tiles[index].titleText.toLowerCase() ==
                          "appointment") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointmentScreen()));
                      } else if (widget.tiles[index].titleText.toLowerCase() ==
                          "orders") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointmentScreen()));
                      }
                    },
                    child: ListTile(
                      leading: Image.asset(
                        widget.tiles[index].imageUrl,
                        cacheHeight: 20,
                      ),
                      title: Text(
                        widget.tiles[index].titleText,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              setState(() {
                _isLoggingOut = true;
              });

              await auth.signout();

              setState(() {
                _isLoggingOut = false;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout Successful')),
              );

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: SizedBox(
              height: 50,
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: _isLoggingOut
                      ? const CircularProgressIndicator()
                      : Image.asset(
                          "assets/Images/profileIcon.png",
                        ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Logout",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ),
                subtitle: const Text(""),
                trailing: _isLoggingOut
                    ? null
                    : const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}
