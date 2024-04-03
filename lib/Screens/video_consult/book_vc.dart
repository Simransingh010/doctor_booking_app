import 'package:doctor_booking_app/Screens/clinic_consult/doctor_data.dart';
import 'package:doctor_booking_app/Screens/video_consult/vc_appointment.dart';
import 'package:doctor_booking_app/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorCallScreen extends StatefulWidget {
  const DoctorCallScreen({Key? key});

  @override
  State<DoctorCallScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorCallScreen> {
  final List<Doctor> doctorList = Doctor.doctors;
  final TextEditingController _searchController = TextEditingController();
  List<Doctor> _foundDoctors = [];

  @override
  void initState() {
    _foundDoctors = List.from(doctorList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 50, 140),
        title: Text(
          'Find Your Doctor',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBox(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: DoctorList(doctors: _foundDoctors),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
    List<Doctor> results = [];
    if (enteredKeyword.isEmpty) {
      results = List.from(doctorList);
    } else {
      results = doctorList
          .where((doctor) =>
              doctor.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundDoctors = results;
    });
  }
}

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundImage: NetworkImage(doctors[index].image),
              ),
              title: Text(
                doctors[index].name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                doctors[index].speciality,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
              trailing: const Icon(
                Icons.check_circle_outline,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '₹ ${doctors[index].bookingFees} Consultation Fees',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          VcBookingScreen.routeName,
                          arguments: doctors[index],
                        );
                      },
                      child: const Text(
                        'Book  Video Call',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        );
      },
    );
  }
}
