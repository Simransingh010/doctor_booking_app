import 'package:doctor_booking_app/Screens/splash_screen_3.dart';
import 'package:doctor_booking_app/widgets/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Razorpay _razorpay = Razorpay();
  List<CartItem> finalItems = [];

  @override
  void initState() {
    super.initState();
    // Register event listeners
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  // @override
  // void dispose() {
  //   // Dispose Razorpay instance
  //   _razorpay.clear();
  //   // super.dispose();
  // }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "Payment Success" + response.paymentId!,
      toastLength: Toast.LENGTH_SHORT,
    );

    // Get the cart items before clearing the cart
    // List<CartItem>
    finalItems =
        List.from(Provider.of<CartProvider>(context, listen: false).cartItems);
    print('items: $finalItems');

    // Navigate to SplashScreen3 with the finalItems
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen3(
          finalItems: finalItems,
        ),
      ),
    );

    // Clear the cart after navigating to SplashScreen3
    Provider.of<CartProvider>(context, listen: false).clearCart();
    print('king: $finalItems');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error: ${response.code} - ${response.message}");
    // Handle payment error if needed
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet: ${response.walletName}");
    // Handle external wallet if needed
  }

  @override
  Widget build(BuildContext context) {
    int tax = 0;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Display the updated total price
              Consumer<CartProvider>(
                builder: (context, cartProvider, _) {
                  return Text(
                    '₹ ${cartProvider.getTotalCost() + tax}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  int totalAmount =
                      (Provider.of<CartProvider>(context, listen: false)
                                  .getTotalCost() *
                              100)
                          .toInt();
                  _razorpay.open({
                    "key": "rzp_test_jSK56Q3nuxBxAM",
                    "amount":
                        totalAmount, // Amount in paisa (e.g., 50000 paisa = ₹500)
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
                    const Size.fromWidth(210),
                  ),
                ),
                child: const Text(
                  'Buy Now',
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
        title: const Text(
          ' My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, _) {
            List<CartItem> items = cartProvider.cartItems;

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return CartItemWidget(
                  item: item,
                  itemCount: item.quantity,
                  onCountChanged: (int newCount) {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final int itemCount;
  final Function(int) onCountChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.itemCount,
    required this.onCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price: ${item.price}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (itemCount > 1) {
                Provider.of<CartProvider>(context, listen: false)
                    .decreaseQuantity(item);
                onCountChanged(itemCount - 1);
              } else {
                Provider.of<CartProvider>(context, listen: false)
                    .removeFromCart(item);
              }
            },
          ),
          Text(itemCount.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .increaseQuantity(item);
              onCountChanged(itemCount + 1);
            },
          ),
        ],
      ),
    );
  }
}
