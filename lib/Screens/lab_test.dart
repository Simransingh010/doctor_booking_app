import 'package:doctor_booking_app/Screens/buy_medicine/buy_medicine.dart';
import 'package:doctor_booking_app/Screens/buy_medicine/medicine_data.dart';
import 'package:doctor_booking_app/Screens/cart_screen.dart';
import 'package:doctor_booking_app/models/lab_test_model.dart';
import 'package:doctor_booking_app/widgets/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LabTestScreen extends StatefulWidget {
  const LabTestScreen({super.key});

  @override
  State<LabTestScreen> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {
  final List<LabTest> _labTests = LabTest.labtests;
  final TextEditingController _searchController = TextEditingController();
  List<LabTest> _filteredLabTests = [];

  @override
  void initState() {
    _filteredLabTests = List.from(_labTests);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Lab Tests',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBox(),
          Expanded(
            child: LabTestList(labTests: _filteredLabTests),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomButton(
              context,
              'Open Medicine',
              Icons.local_pharmacy,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MedicineScreen()),
              ),
            ),
            _buildBottomButton(
              context,
              'Open Cart',
              Icons.shopping_cart,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: _runFilter,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<LabTest> results = [];
    if (enteredKeyword.isEmpty) {
      results = List.from(_labTests);
    } else {
      results = _labTests
          .where((labTest) =>
              labTest.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredLabTests = results;
    });
  }

  Widget _buildBottomButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}

class LabTestList extends StatelessWidget {
  const LabTestList({required this.labTests, super.key});

  final List<LabTest> labTests;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: labTests.length,
      itemBuilder: (context, index) {
        final labTest = labTests[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            // leading: ImageContainer(
            //   imageUrl: labTest.imageUrl, // Assuming LabTest has an imageUrl
            //   width: 60,
            //   height: 60,
            //   borderRadius: 5,
            // ),
            title: Text(
              labTest.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '₹ ${labTest.price}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart(
                  CartItem(
                    name: labTest.name,
                    price: labTest.price,
                    quantity: 1,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Item Added to Cart'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Book',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                MedicineDataScreen.routeName,
                arguments: labTest,
              );
            },
          ),
        );
      },
    );
  }
}
