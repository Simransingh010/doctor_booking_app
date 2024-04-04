import 'package:doctor_booking_app/Screens/clinic_consult/book_doctor.dart';
import 'package:flutter/widgets.dart';

import '../models/symptoms.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        CircleAvatar,
        Column,
        EdgeInsets,
        FontWeight,
        NetworkImage,
        Padding,
        Row,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class SymptomsGrid extends StatefulWidget {
  const SymptomsGrid({
    required this.symptom,
    super.key,
  });
  final List<Symptoms> symptom;

  @override
  State<SymptomsGrid> createState() => _SymptomsGridState();
}

class _SymptomsGridState extends State<SymptomsGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowBuilder(widget.symptom.sublist(0, 4)),
        RowBuilder(widget.symptom.sublist(4, 8))
      ],
    );
  }
}

class RowBuilder extends StatelessWidget {
  final List<Symptoms> symptom;

  const RowBuilder(this.symptom, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(symptom.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 14,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                DoctorScreen.routeName,
              );
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(symptom[index].imageUrl),
                  radius: 30,
                ),
                SizedBox(
                  height: 18,
                  child: Text(
                    symptom[index].text1,
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
