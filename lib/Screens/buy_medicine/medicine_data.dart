import 'package:doctor_booking_app/Screens/cart_screen.dart';
import 'package:doctor_booking_app/models/lab_test_model.dart';
import 'package:doctor_booking_app/models/medicine_model.dart';
import 'package:doctor_booking_app/widgets/cart_provider.dart';
import 'package:doctor_booking_app/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MedicineDataScreen extends StatelessWidget {
  const MedicineDataScreen({super.key});

  static String get routeName => '/MedicineDataScreen';

  @override
  Widget build(BuildContext context) {
    final medicines = ModalRoute.of(context)!.settings.arguments as Medicine;

    void shareMedicineDetails() {
      final text =
          'Check out this medicine: ${medicines.name}\nPrice: ₹${medicines.price}\n${medicines.imageUrl}';
      Share.share(text);
    }

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Open Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              print('share button pressed');
              shareMedicineDetails();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Center(
            child: ImageContainer(
              imageUrl: medicines.imageUrl,
              borderRadius: 15,
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            medicines.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '₹ ${medicines.price}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'INCLUSIVE OF ALL TAXES',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addToCart(
                CartItem(
                  name: medicines.name,
                  price: medicines.price.toDouble(),
                ) as CartItem,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item Added to Cart Successfully'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          buildSectionTitle('Safety Information'),
          buildSectionContent(
              'Keep Out of range of children and Pets. Always store in cool Places.'),
          const SizedBox(height: 20),
          buildSectionTitle('Return Policy'),
          buildSectionContent('This Item is not Returnable'),
          const SizedBox(height: 20),
          buildSectionTitle('Disclaimer'),
          buildSectionContent(
              'We have made all possible efforts to ensure that the information provided here is accurate, up-to-date and complete, however, it should not be treated as a substitute for professional medical.'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    );
  }
}
