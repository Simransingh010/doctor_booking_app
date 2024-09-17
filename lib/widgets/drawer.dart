import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking_app/Screens/appointment_screen.dart';
import 'package:doctor_booking_app/firebase%20login/auth_services.dart';
import 'package:doctor_booking_app/firebase%20login/login_screen.dart';
import 'package:doctor_booking_app/models/drawer_model.dart';
import 'package:doctor_booking_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drawers extends StatefulWidget {
  const Drawers({
    required this.tiles,
    super.key,
  });

  final List<DrawerTile> tiles;

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  final AuthService _auth = AuthService();
  late Stream<UserModel2> _userStream;
  bool _isLoggingOut = false;

  @override
  void initState() {
    super.initState();
    _userStream = _fetchUserData();
  }

  Stream<UserModel2> _fetchUserData() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return Stream.error('User not logged in');
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .snapshots()
        .map((doc) {
      if (doc.exists && doc.data() != null) {
        return UserModel2.fromMap(doc.data()! as Map<String, dynamic>);
      } else {
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
          _buildUserProfileTile(),
          const Divider(thickness: 0, height: 10),
          _buildDrawerTiles(),
          _buildLogoutTile(),
        ],
      ),
    );
  }

  Widget _buildUserProfileTile() {
    return StreamBuilder<UserModel2>(
      stream: _userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            return _UserProfileTile(user: user);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildDrawerTiles() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.77,
      child: ListView.builder(
        itemCount: widget.tiles.length,
        itemBuilder: (context, index) {
          return _DrawerTileItem(tile: widget.tiles[index]);
        },
      ),
    );
  }

  Widget _buildLogoutTile() {
    return InkWell(
      onTap: _handleLogout,
      child: SizedBox(
        height: 50,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: _isLoggingOut
                ? const CircularProgressIndicator()
                : Image.asset("assets/Images/profileIcon.png"),
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
          trailing: _isLoggingOut
              ? null
              : const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ),
      ),
    );
  }

  Future<void> _handleLogout() async {
    setState(() => _isLoggingOut = true);
    await _auth.signout();
    setState(() => _isLoggingOut = false);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logout Successful')),
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}

class _UserProfileTile extends StatelessWidget {
  const _UserProfileTile({required this.user});

  final UserModel2 user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Image.asset("assets/Images/profileIcon.png"),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          user.FullName,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
    );
  }
}

class _DrawerTileItem extends StatelessWidget {
  const _DrawerTileItem({required this.tile});

  final DrawerTile tile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleTileTap(context),
      child: ListTile(
        leading: Image.asset(tile.imageUrl, cacheHeight: 20),
        title: Text(
          tile.titleText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
      ),
    );
  }

  void _handleTileTap(BuildContext context) {
    final lowerCaseTitle = tile.titleText.toLowerCase();
    if (lowerCaseTitle == "appointment" || lowerCaseTitle == "orders") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppointmentScreen()),
      );
    }
  }
}
