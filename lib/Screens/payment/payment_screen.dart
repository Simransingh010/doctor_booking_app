import 'package:doctor_booking_app/Screens/payment/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'payment_origin.dart';
// import 'splash_screen.dart'; // Import your splash screen file

class RazorpayService {
  static final RazorpayService _instance = RazorpayService._internal();
  late Razorpay _razorpay;
  late BuildContext _context; // Store context for navigation

  factory RazorpayService() {
    return _instance;
  }

  RazorpayService._internal() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay.clear();
  }

  void _handlePaymentSuccess(
      PaymentSuccessResponse response, PaymentOrigin origin) async {
    print('handle payment success is called');
    Fluttertoast.showToast(
      msg: "Payment Success" + response.paymentId!,
      toastLength: Toast.LENGTH_LONG,
    );

    // Navigate to the splash screen after payment success
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (context) =>
            SplashScreen1(), // Adjust this line if SplashScreen1 doesn't accept an argument
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error: ${response.code} - ${response.message}");
    // Handle payment error, you can use callbacks or streams here to notify UI components
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet: ${response.walletName}");
    // Handle external wallet, you can use callbacks or streams here to notify UI components
  }

  void openPayment(BuildContext context, int amount, PaymentOrigin origin) {
    _context = context; // Store context for navigation
    // Opening the payment
    _razorpay.open({
      "key": "rzp_test_jSK56Q3nuxBxAM",
      "amount": amount, // Amount in paisa (e.g., 50000 paisa = ₹500)
      // Other parameters such as order_id, currency, etc. can be included here
    });
    print('successful');
  }
}
