import 'package:doctor_booking_app/Screens/buy_medicine/buy_medicine.dart';
import 'package:doctor_booking_app/Screens/clinic_consult/book_doctor.dart';
import 'package:doctor_booking_app/Screens/video_consult/book_vc.dart';
import 'package:doctor_booking_app/models/medicine_model.dart';
import 'package:flutter/widgets.dart';

import '../models/symptoms.dart';
import 'package:flutter/material.dart'
    show
        AlertDialog,
        BuildContext,
        ButtonStyle,
        CircleAvatar,
        Colors,
        Column,
        Dialog,
        EdgeInsets,
        FontWeight,
        MaterialStateProperty,
        NetworkImage,
        Padding,
        Row,
        StatelessWidget,
        Text,
        TextButton,
        TextStyle,
        Widget,
        showDialog;

class SymptomWidget extends StatefulWidget {
  const SymptomWidget({
    required this.symptom,
    super.key,
  });
  final List<Symptoms> symptom;

  @override
  State<SymptomWidget> createState() => _SymptomsGridState();
}

class _SymptomsGridState extends State<SymptomWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowBuilder2(widget.symptom.sublist(0, 4)),
        RowBuilder2(widget.symptom.sublist(4, 8)),
        RowBuilder2(widget.symptom.sublist(8, 12)),
        RowBuilder2(widget.symptom.sublist(12, 16)),
        RowBuilder2(widget.symptom.sublist(16, 20)),
        RowBuilder2(widget.symptom.sublist(20, 24)),
        RowBuilder2(widget.symptom.sublist(24, 28)),
        RowBuilder2(widget.symptom.sublist(28, 32)),
        RowBuilder2(widget.symptom.sublist(32, 36)),
      ],
    );
  }
}

class RowBuilder2 extends StatelessWidget {
  final List<Symptoms> symptom;

  const RowBuilder2(this.symptom, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(symptom.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 3,
            vertical: 14,
          ),
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      insetPadding: EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.23,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Choose an Option",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            Size.fromWidth(200)),
                                        // minimumSize: MaterialStateProperty.all(
                                        //     Size.fromHeight(10)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color.fromARGB(
                                              255, 41, 50, 140),
                                        )),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, DoctorScreen.routeName);
                                    },
                                    child: Text(
                                      'Clinic Visit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  TextButton(
                                      style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              Size.fromWidth(200)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 41, 50, 140),
                                          )),
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            DoctorCallScreen.routeName);
                                      },
                                      child: Text(
                                        'Online Consult',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    // return AlertDialog(
                    //   // contentPadding: EdgeInsets.all(1000),
                    //   alignment: Alignment.center,
                    //   // title: Text("Choose an Option"),
                    //   actions: <Widget>[
                    //     Column(
                    //       children: [
                    //         Text("Choose an Option"),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             TextButton(
                    //               style: ButtonStyle(
                    //                   fixedSize: MaterialStateProperty.all(
                    //                       Size.fromWidth(150)),
                    //                   backgroundColor:
                    //                       MaterialStateProperty.all(
                    //                     const Color.fromARGB(255, 41, 50, 140),
                    //                   )),
                    //               onPressed: () {},
                    //               child: Text(
                    //                 'Clinic Visit',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 12),
                    //               ),
                    //             ),
                    //             TextButton(
                    //                 onPressed: () {},
                    //                 child: Text('Online Consult'))
                    //           ],
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // );
                  });
              // Navigator.pushNamed(
              //   context,
              //   DoctorScreen.routeName,
              // );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.23,
              height: MediaQuery.of(context).size.height * 0.136,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(symptom[index].imageUrl),
                    radius: 34,
                  ),
                  SizedBox(
                    height: 32,
                    child: Center(
                      child: Text(
                        maxLines: 2,
                        symptom[index].text1,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
