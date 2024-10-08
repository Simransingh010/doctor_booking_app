import 'package:android_intent/android_intent.dart';
import 'package:doctor_booking_app/Screens/video_consult/splash_screen_2.dart';
import 'package:doctor_booking_app/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class VcBookingScreen extends StatefulWidget {
  const VcBookingScreen({super.key});

  static String get routeName => '/VcBookingScreen';

  @override
  State<VcBookingScreen> createState() => _VcBookingScreenState();
}

class _VcBookingScreenState extends State<VcBookingScreen> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    // Register event listeners
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // Dispose Razorpay instance
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Success: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen2(),
        ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Error: ${response.code} - ${response.message}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet: ${response.walletName}",
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    final doctors = ModalRoute.of(context)!.settings.arguments as Doctor;
    double tax = 49;
    int totalAmount = ((doctors.bookingFees + tax).round()) * 100;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  _razorpay.open({
                    "key": "rzp_test_Lc97DoMrHztQ1O",
                    "amount": totalAmount,
                    // Other parameters such as order_id, currency, etc. can be included here
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  fixedSize: MaterialStateProperty.all(
                    const Size.fromWidth(200),
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
              'Book Video Appointment',
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
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Highly Recommended for Doctor \n Friendliness',
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
                        fontSize: 11,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' Appointment Confirmed Instantly',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
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
