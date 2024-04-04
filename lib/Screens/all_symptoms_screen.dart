import 'package:doctor_booking_app/Screens/symptom_widget_2.dart';
import 'package:doctor_booking_app/models/symptoms.dart';
import 'package:flutter/material.dart';

class AllSymptomScreen extends StatelessWidget {
  const AllSymptomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 50, 140),
        title: Text(
          'Consult a Doctor',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              'Choose from Best Doctors',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SymptomWidget(
            symptom: Symptoms.symptom,
          )
        ],
      ),
    );
  }
}
