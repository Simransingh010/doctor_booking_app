import 'package:doctor_booking_app/Screens/medicine_data.dart';
import 'package:doctor_booking_app/models/doctor_model.dart';
import 'package:doctor_booking_app/models/medicine_model.dart';
import 'package:doctor_booking_app/widgets/image_container.dart';
import 'package:flutter/material.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  static String get routeName => '/MedicineScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '200+ Products Available',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: MedicineList(
                medicines: Medicine.medicines,
              ),
            ),
          ],
        ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageContainer(
                            imageUrl: medicines[index].imageUrl,
                            width: 80,
                            height: 80,
                            borderRadius: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  medicines[index].name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  ' MRP ${medicines[index].price}',
                                  style: const TextStyle(
                                    fontSize: 15,
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
                                )),
                            onPressed: () {},
                            child: const Text(
                              "Add to Cart",
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}

// ListTile(
//             dense: false,
//             leading: ImageContainer(
//               imageUrl: medicines[index].imageUrl,
//               width: 100,
//               height: 100,
//               borderRadius: 3,
//             ),
//             title: Text(
//               medicines[index].name,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             subtitle: Text(
//               ' MRP ${medicines[index].price}',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             trailing: ElevatedButton(
//               onPressed: () {},
//               child: Text("Add to Cart"),
//             ),
//           ),