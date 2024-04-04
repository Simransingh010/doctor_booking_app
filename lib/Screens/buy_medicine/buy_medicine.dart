import 'package:doctor_booking_app/Screens/buy_medicine/medicine_data.dart';
import 'package:doctor_booking_app/Screens/cart_screen.dart';
import 'package:doctor_booking_app/Screens/lab_test.dart';
import 'package:doctor_booking_app/models/medicine_model.dart';
import 'package:doctor_booking_app/widgets/cart_provider.dart';
import 'package:doctor_booking_app/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:provider/provider.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({Key? key});

  static String get routeName => '/MedicineScreen';

  @override
  _MedicineScreenState createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LabTestScreen(),
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
                  const Size.fromWidth(155),
                ),
              ),
              child: const Text(
                'Open Lab Tests',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
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
                  const Size.fromWidth(155),
                ),
              ),
              child: const Text(
                'Open Cart',
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
      appBar: AppBar(
        title: const Text(
          'Buy Medicines',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBox(),
            Expanded(
              child: MedicineList(medicines: _filteredMedicines),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: _runFilter,
        decoration: InputDecoration(
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
}

class MedicineList extends StatelessWidget {
  const MedicineList({
    Key? key,
    required this.medicines,
  }) : super(key: key);

  final List<Medicine> medicines;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              MedicineDataScreen.routeName,
              arguments: medicines[index],
            );
          },
          child: Card(
            elevation: 0,
            child: SizedBox(
              height: 130,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageContainer(
                      imageUrl: medicines[index].imageUrl,
                      width: 80,
                      height: 80,
                      borderRadius: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            medicines[index].name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            ' MRP ${medicines[index].price}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        fixedSize: MaterialStateProperty.all(
                          Size.fromWidth(130),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addToCart(
                          CartItem(
                            name: medicines[index].name,
                            price: medicines[index].price.toDouble(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          dismissDirection: DismissDirection.horizontal,
                          width: 250,
                          content: Text('Item Added to Cart Successfully'),
                          duration: Duration(seconds: 1),
                        ));
                      },
                      child: const Text("Add to Cart"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
