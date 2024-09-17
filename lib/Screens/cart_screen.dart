import 'package:doctor_booking_app/Screens/splash_screen_3.dart';
import 'package:doctor_booking_app/widgets/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
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
    Fluttertoast.showToast(msg: "Payment Success: ${response.paymentId}");
    List<CartItem> finalItems =
        List.from(Provider.of<CartProvider>(context, listen: false).cartItems);
    Provider.of<CartProvider>(context, listen: false).clearCart();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen3(finalItems: finalItems),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Error: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "External Wallet: ${response.walletName}");
  }

  void _openCheckout() {
    int totalAmount =
        (Provider.of<CartProvider>(context, listen: false).getTotalCost() * 100)
            .toInt();
    _razorpay.open({
      "key": "rzp_test_Lc97DoMrHztQ1O",
      "amount": totalAmount,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 41, 50, 140),
        elevation: 0,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          List<CartItem> items = cartProvider.cartItems;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CartItemWidget(item: item);
                  },
                ),
              ),
              const Divider(thickness: 2),
              _buildTotalSection(cartProvider),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: _openCheckout,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 41, 50, 140),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'Proceed to Checkout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalSection(CartProvider cartProvider) {
    double gst = (cartProvider.getTotalCost()) * 0.12;
    double subTotal = cartProvider.getTotalCost();
    double totalAmount = gst + subTotal;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'GST(12%):',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '₹${gst.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sub Total:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '₹${subTotal.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '₹${totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 41, 50, 140),
          child: Text(
            item.name[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Price: ₹${item.price.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .decreaseQuantity(item);
              },
            ),
            Text(
              item.quantity.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .increaseQuantity(item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
