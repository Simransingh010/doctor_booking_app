import 'dart:developer';
import 'package:android_intent/android_intent.dart';
import 'package:doctor_booking_app/Screens/payment/payment_success.dart';
import 'package:doctor_booking_app/models/doctor_model.dart';
import 'package:doctor_booking_app/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  static String get routeName => '/BookingScreen';

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "Payment Success" + response.paymentId!,
      toastLength: Toast.LENGTH_SHORT,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen1()),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error: ${response.code} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet: ${response.walletName}");
  }

  @override
  Widget build(BuildContext context) {
    final doctors = ModalRoute.of(context)!.settings.arguments as Doctor;
    double tax = 49;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.local_hospital_rounded, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              'Book In-Clinic Appointment',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildDoctorCard(context, doctors),
          SizedBox(height: 16),
          _buildClinicInfoCard(context, doctors),
          SizedBox(height: 16),
          _buildBillDetailsCard(context, doctors, tax),
          SizedBox(height: 16),
          _buildRecommendationCard(context),
          SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: MapWidget(
              latitude: doctors.latitude,
              longitude: doctors.longitude,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(context, doctors, tax),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Doctor doctors) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(doctors.image),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctors.name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      doctors.speciality,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.message, size: 16),
                        SizedBox(width: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            'Highly Recommended for Doctor Friendliness',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.local_hospital_rounded),
                SizedBox(width: 8),
                Text(
                  'Clinic Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              doctors.clinicAddress,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClinicInfoCard(BuildContext context, Doctor doctors) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clinic Accepts appointments only via Calls',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 8),
            Text(
              'To check for Doctor Availability and appointment Confirmation, Please Call the Clinic',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => makePhoneCall(doctors.phoneNo),
              icon: Icon(Icons.call),
              label: Text(
                'Contact Clinic',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillDetailsCard(
      BuildContext context, Doctor doctors, double tax) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bill Details',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Consultation Fee',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '₹ ${doctors.bookingFees}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service Tax and Fees',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '₹ $tax',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payable',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  '₹ ${doctors.bookingFees + tax}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Highly Recommended For',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.support_agent_sharp),
              title: Text(
                'Doctor Friendliness',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                '90% patients Find the Doctor Friendly and Approachable',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text(
                'Detailed Treatment Explanation',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                '88% Patients recommend the doctor for in-depth explanation of their Health Issues',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context, Doctor doctors, double tax) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹ ${doctors.bookingFees + tax}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            ElevatedButton(
              onPressed: () {
                log('CLICKED');
                int totalAmount = ((doctors.bookingFees + tax).round()) * 100;
                _razorpay.open({
                  "key": "rzp_test_Lc97DoMrHztQ1O",
                  "amount": totalAmount,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                elevation: 5,
              ),
              child: Text(
                'Pay and Book',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void makePhoneCall(String phoneNumber) {
  final intent = AndroidIntent(
    action: 'android.intent.action.DIAL',
    data: 'tel:$phoneNumber',
  );
  intent.launch();
}
