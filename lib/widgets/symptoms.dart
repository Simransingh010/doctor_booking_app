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

class SymptomsGrid extends StatelessWidget {
  const SymptomsGrid({
    required this.symptom,
    super.key,
  });
  final List<Symptoms> symptom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowBuilder(symptom.sublist(0, 4)),
        RowBuilder(symptom.sublist(4, 8))
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
            horizontal: 3,
            vertical: 14,
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(symptom[index].imageUrl),
                radius: 34,
              ),

              // ImageContainer(
              //   imageUrl: symptom[index].imageUrl,
              //   width: 40,
              //   height: 40,
              // ),
              SizedBox(
                height: 20,
                child: Text(
                  symptom[index].text1,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold),
                ),
                // child: Image(
                //   image: NetworkImage(symptom[index].imageUrl),
                //   fit: BoxFit.contain,
                // ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
