import 'package:android_intent/android_intent.dart';
import 'package:doctor_booking_app/Screens/payment_splash.dart';
import 'package:doctor_booking_app/models/doctor_model.dart';
import 'package:doctor_booking_app/widgets/location.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  static String get routeName => '/BookingScreen';

  @override
  Widget build(BuildContext context) {
    final doctors = ModalRoute.of(context)!.settings.arguments as Doctor;
    double tax = 49;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${doctors.bookingFees + tax}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentSplashScreen(),
                      ));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  fixedSize: MaterialStateProperty.all(
                    const Size.fromWidth(250),
                  ),
                ),
                child: const Text(
                  'Pay and Book',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(
              Icons.local_hospital_rounded,
              size: 25,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Book In-Clinic Appointment',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              maxRadius: 40,
              backgroundImage: NetworkImage(doctors.image),
            ),
            title: Text(
              doctors.name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctors.speciality,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.message,
                      size: 17,
                    ),
                    Text(
                      'Highly Recommended for Doctor Friendliness',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 10,
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.local_hospital_rounded),
                      Text('Clinic Address'),
                    ],
                  ),
                  Text(
                    doctors.clinicAddress,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 15,
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Clinic Accepts appointments only via Calls',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'To check for Doctor Availability and appointment Confirmation, Please Call the Clinic',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size.fromWidth(170),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  onPressed: () {
                    makePhoneCall(doctors.phoneNo);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.call, color: Colors.blue),
                      Text(
                        'Contact Clinic',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 20,
            thickness: 5,
          ),
          const SizedBox(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text.rich(
                    TextSpan(
                        text: 'HealthMate Promise',
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                              text: ' Appointment Confirmed Instantly',
                              style: TextStyle(
                                color: Colors.black,
                              ))
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 15,
            thickness: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Bill Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Consultation Fee',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text('₹ ${doctors.bookingFees}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Service Tax and Fees',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text('₹ $tax'),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[300],
                endIndent: 20,
                indent: 20,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Payable',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('₹ ${doctors.bookingFees + tax}'),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[300],
                height: 15,
                thickness: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Highly Recommended For',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.support_agent_sharp),
                      title: Text(
                        'Doctor Friendliness',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '90% patients Find the Doctor Friendly and Approachable',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text(
                        'Detailed Treatment Explanation',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '88% Patients recommend the doctor for in-depth explanation of their Health Issues',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: MapWidget(
                      latitude: doctors.latitude, longitude: doctors.longitude),
                ),
              ),
              const Divider(
                thickness: 1,
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

makePhoneCall(String phoneNumber) {
  final intent = AndroidIntent(
    action: 'android.intent.action.DIAL', // Action for phone call
    data: 'tel:$phoneNumber', // Phone number to dial
  );
  intent.launch();
}
