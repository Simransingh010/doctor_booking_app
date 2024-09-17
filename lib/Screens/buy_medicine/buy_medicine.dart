import 'package:doctor_booking_app/Screens/buy_medicine/medicine_data.dart';
import 'package:doctor_booking_app/Screens/cart_screen.dart';
import 'package:doctor_booking_app/Screens/lab_test.dart';
import 'package:doctor_booking_app/models/medicine_model.dart';
import 'package:doctor_booking_app/widgets/cart_provider.dart';
import 'package:doctor_booking_app/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({Key? key});

  static String get routeName => '/MedicineScreen';

  @override
  MedicineScreenState createState() => MedicineScreenState();
}

class MedicineScreenState extends State<MedicineScreen> {
  final List<Medicine> _medicineList = Medicine.medicines;
  final TextEditingController _searchController = TextEditingController();
  List<Medicine> _filteredMedicines = [];

  @override
  void initState() {
    _filteredMedicines = List.from(_medicineList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buy Medicines',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBox(),
          Expanded(
            child: MedicineList(medicines: _filteredMedicines),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomButton(
              context,
              'Open Lab Tests',
              Icons.biotech,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LabTestScreen()),
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
    List<Medicine> results = [];
    if (enteredKeyword.isEmpty) {
      results = List.from(_medicineList);
    } else {
      results = _medicineList
          .where((medicine) => medicine.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredMedicines = results;
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
        style: TextStyle(
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

class MedicineList extends StatelessWidget {
  const MedicineList({
    super.key,
    required this.medicines,
  });

  final List<Medicine> medicines;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: ImageContainer(
              imageUrl: medicines[index].imageUrl,
              width: 60,
              height: 60,
              borderRadius: 5,
            ),
            title: Text(
              medicines[index].name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'MRP ${medicines[index].price}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart(
                  CartItem(
                    name: medicines[index].name,
                    price: medicines[index].price.toDouble(),
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
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                MedicineDataScreen.routeName,
                arguments: medicines[index],
              );
            },
          ),
        );
      },
    );
  }
}
