import 'package:equatable/equatable.dart';

class Symptoms extends Equatable {
  final String imageUrl;
  final String text1;
  final String id;

  const Symptoms({
    required this.id,
    required this.imageUrl,
    required this.text1,
  });

  static List<Symptoms> symptom = [
    Symptoms(
      id: '1',
      imageUrl: 'https://shorturl.at/kJOR7',
      text1: 'Pregnancy Issues',
    ),
    Symptoms(
      id: '2',
      imageUrl: 'https://shorturl.at/oCGNU',
      text1: 'Stress & Anxiety',
    ),
    Symptoms(
      id: '3',
      imageUrl: 'https://shorturl.at/BCIP5',
      text1: 'Bone & Joint Tissues',
    ),
    Symptoms(
      id: '4',
      imageUrl: 'https://shorturl.at/ayLV2',
      text1: 'Diabetes',
    ),
    Symptoms(
      id: '5',
      imageUrl: 'https://shorturl.at/koszL',
      text1: 'Stomach Pain    ',
    ),
    Symptoms(
      id: '6',
      imageUrl: 'https://rb.gy/pb1fmm',
      text1: 'Pimples & Acne',
    ),
    Symptoms(
      id: '7',
      imageUrl: 'https://rb.gy/oezp6d',
      text1: 'Hair & Scalp Issues   ',
    ),
    Symptoms(
      id: '8',
      imageUrl: 'https://rb.gy/tjlumb',
      text1: 'Sexual Disorders',
    ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [imageUrl, text1];
}
