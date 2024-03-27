// import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map Screen with Google Maps'),
//       ),
//       body: MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           child: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: LatLng(
//               37.7749, -122.4194), // Initial location (latitude, longitude)
//           zoom: 14.0, // Initial zoom level
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//       )),
//     );
//   }
// }
