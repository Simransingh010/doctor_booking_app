import '../models/symptoms.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        CircleAvatar,
        Column,
        Container,
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

  RowBuilder(this.symptom);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(symptom.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 7,
            vertical: 20,
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(symptom[index].imageUrl),
                radius: 35,
              ),

              // ImageContainer(
              //   imageUrl: symptom[index].imageUrl,
              //   width: 40,
              //   height: 40,
              // ),
              Container(
                height: 20,
                child: Text(
                  symptom[index].text1,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
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
