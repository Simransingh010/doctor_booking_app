import 'package:doctor_booking_app/Screens/video_consult/vc_appointment.dart';
import 'package:doctor_booking_app/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorCallScreen extends StatefulWidget {
  const DoctorCallScreen({Key? key});
  static String get routeName => '/DoctorCallScreen';

  @override
  State<DoctorCallScreen> createState() => _DoctorCallScreenState();
}

class _DoctorCallScreenState extends State<DoctorCallScreen> {
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
          const SizedBox(height: 10),
          Expanded(
            child: _foundDoctors.isNotEmpty
                ? DoctorList(doctors: _foundDoctors)
                : const Center(
                    child: Text(
                      'No doctors found',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: _runFilter,
        decoration: InputDecoration(
          hintText: 'Search doctors',
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
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
        final doctor = doctors[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundImage: NetworkImage(doctor.image),
            ),
            title: Text(
              doctor.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.speciality,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  '₹ ${doctor.bookingFees} Consultation Fees',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  VcBookingScreen.routeName,
                  arguments: doctor,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 41, 50, 140),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Book Video Call',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
