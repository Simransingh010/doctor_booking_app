import 'package:doctor_booking_app/models/drawer_model.dart';
import 'package:doctor_booking_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DrawerTile tiles = DrawerTile.tiles[0];
    return Scaffold(
      drawer: Drawers(
        tiles: DrawerTile.tiles,
      ),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        toolbarHeight: 150,
        titleSpacing: 0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, right: 0, left: 0),
          child: Builder(
            builder: (context) => IconButton(
              alignment: Alignment.topLeft,
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Image.asset("assets/Images/profileIcon.png"),
            ),
          ),
        ),
        title: Builder(builder: (context) {
          return Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 35, right: 15),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.wallet,
                size: 25,
              ),
            ),
          ),
        ],
      ),

      // Container(
      //           color: Colors.red,
      //           width: MediaQuery.of(context).size.width,
      //           child: TextField(
      //             maxLength: null,
      //             style: GoogleFonts.lato(
      //               fontSize: 20,
      //               color: Colors.black,
      //             ),
      //             // keyboardType: TextInputType.emailAddress,
      //             obscureText: false,

      //             decoration: InputDecoration(
      //               contentPadding: EdgeInsets.only(top: 5),
      //               prefixIcon: Icon(
      //                 Icons.search,
      //                 size: 30,
      //                 color: Colors.grey,
      //               ),
      //               // border: InputBorder,
      //               hintText: 'Search',
      //               hintStyle: GoogleFonts.lato(fontSize: 20),
      //             ),
      //           ),
      //         ),
    );
  }
}
