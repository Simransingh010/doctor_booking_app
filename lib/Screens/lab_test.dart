import 'package:doctor_booking_app/models/lab_test.dart';
import 'package:flutter/material.dart';

class LabTestScreen extends StatefulWidget {
  const LabTestScreen({Key? key}) : super(key: key);

  @override
  _LabTestScreenState createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {
  late List<LabTest> _labTests;
  late List<LabTest> _searchResult;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _labTests = LabTest.labtests;
    _searchResult = _labTests;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _searchResult = _labTests
            .where((labTest) =>
                labTest.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _searchResult = _labTests;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Lab Test',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterSearchResults,
                decoration: InputDecoration(
                  hintText: 'Search lab tests...',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'All Lab Tests',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '${_searchResult.length} ${_searchResult.length == 1 ? 'Lab Test' : 'Lab Tests'} Available',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Expanded(
              flex: 1,
              child: TestList(labtests: _searchResult),
            ),
          ],
        ),
      ),
    );
  }
}

class TestList extends StatelessWidget {
  const TestList({
    required this.labtests,
    Key? key,
  }) : super(key: key);

  final List<LabTest> labtests;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (labtests.length / 2).ceil(),
      itemBuilder: (context, rowIndex) {
        final startIndex = rowIndex * 2;
        final endIndex = startIndex + 2;
        final currentRowTests = labtests.sublist(
          startIndex,
          endIndex < labtests.length ? endIndex : labtests.length,
        );
        return Column(
          children: currentRowTests.map((labTest) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Card(
                elevation: 1,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  title: Text(
                    labTest.name,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 41, 50, 140),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '₹ ${labTest.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(70, 30),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 41, 50, 140),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
