import 'package:doctor_booking_app/models/lab_test.dart';
import 'package:flutter/material.dart';

class LabTestScreen extends StatelessWidget {
  const LabTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Lab Test',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
                  'All Lab Tests',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '70+ Body Test Available',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 1,
                child: TestList(
                  labtests: LabTest.labtests,
                )),
          ],
        ),
      ),
    );
  }
}

class TestList extends StatelessWidget {
  const TestList({
    required this.labtests,
    super.key,
  });

  final List<LabTest> labtests;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: (labtests.length / 2).ceil(),
      itemBuilder: (context, rowIndex) {
        final startIndex = rowIndex * 2;
        final endIndex = startIndex + 2;
        final currentRowTests = labtests.sublist(
          startIndex,
          endIndex < labtests.length ? endIndex : labtests.length,
        );
        return Row(
          children: currentRowTests.map((labTest) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Text(
                              labTest.name,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 41, 50, 140),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0009,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '₹ ${labtests[rowIndex].price}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    Size(
                                      70,
                                      30,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 41, 50, 140)),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Book',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

//         return Row(
//           children: currentRowTests.map(labtests){},
//         )

//         return Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               elevation: 1,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         width: 100,
//                       ),
//                       Text(labtests[index].name),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
