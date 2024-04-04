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
    const Symptoms(
      id: '1',
      imageUrl: 'https://shorturl.at/kJOR7',
      text1: 'Pregnancy Issues',
    ),
    const Symptoms(
      id: '2',
      imageUrl: 'https://shorturl.at/oCGNU',
      text1: 'Stress & Anxiety',
    ),
    const Symptoms(
      id: '3',
      imageUrl: 'https://shorturl.at/BCIP5',
      text1: 'Bone & Joint Tissues',
    ),
    const Symptoms(
      id: '4',
      imageUrl: 'https://shorturl.at/ayLV2',
      text1: 'Diabetes',
    ),
    const Symptoms(
      id: '5',
      imageUrl: 'https://shorturl.at/koszL',
      text1: 'Stomach Pain    ',
    ),
    const Symptoms(
      id: '6',
      imageUrl: 'https://rb.gy/pb1fmm',
      text1: 'Pimples & Acne',
    ),
    const Symptoms(
      id: '7',
      imageUrl: 'https://rb.gy/oezp6d',
      text1: 'Hair & Scalp Issues   ',
    ),
    const Symptoms(
      id: '8',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2248/2248294.png',
      text1: 'Vertigo',
    ),
    const Symptoms(
      id: '9',
      imageUrl:
          'https://as2.ftcdn.net/v2/jpg/03/36/69/37/1000_F_336693764_f1fWJXB8d2nMDNoFWsM6LgNE2jpFKQFp.jpg',
      text1: 'PCOS',
    ),
    const Symptoms(
      id: '10',
      imageUrl:
          'https://cdn2.vectorstock.com/i/1000x1000/86/71/human-thyroid-icon-in-black-style-isolated-vector-12728671.jpg',
      text1: 'Thyroid',
    ),
    const Symptoms(
      id: '11',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/4843/4843993.png',
      text1: 'HeadAche',
    ),
    const Symptoms(
      id: '12',
      imageUrl:
          'https://c8.alamy.com/comp/2GBJE2F/antifungal-cream-rgb-color-icon-fighting-fungal-infections-skin-condition-treatment-itching-sensations-on-relief-antiseptic-ability-isolated-vect-2GBJE2F.jpg',
      text1: 'Fungal Infection',
    ),
    const Symptoms(
      id: '13',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/4986/4986231.png',
      text1: 'Back Pain',
    ),
    const Symptoms(
      id: '14',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/6192/6192086.png',
      text1: 'Fever',
    ),
    const Symptoms(
      id: '15',
      imageUrl:
          'https://www.shutterstock.com/shutterstock/photos/597223502/display_1500/stock-vector-high-blood-pressure-icon-597223502.jpg',
      text1: 'High BP',
    ),
    const Symptoms(
      id: '16',
      imageUrl:
          'https://cdn.icon-icons.com/icons2/2239/PNG/512/dizziness_icon_134828.png',
      text1: 'Dizziness',
    ),
    const Symptoms(
      id: '17',
      imageUrl:
          'https://cdn0.iconfinder.com/data/icons/coronavirus-covid-19-1/64/Pneumonia-lungs-coronavirus-medical-organ-512.png',
      text1: 'Pneumonia',
    ),
    const Symptoms(
      id: '18',
      imageUrl:
          'https://img.freepik.com/premium-vector/vector-picture-young-woman-with-vitiligo_641042-163.jpg',
      text1: 'Vitilgo',
    ),
    const Symptoms(
      id: '19',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/4771/4771219.png',
      text1: 'Dandruff',
    ),
    const Symptoms(
      id: '20',
      imageUrl:
          'https://www.shutterstock.com/image-vector/mouth-ulcer-vector-illustration-260nw-1576768177.jpg',
      text1: 'Mouth Sores',
    ),
    const Symptoms(
      id: '21',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/11357/11357018.png',
      text1: 'Snoring',
    ),
    const Symptoms(
      id: '22',
      imageUrl:
          'https://thumbs.dreamstime.com/z/menstruation-color-icon-menstruation-color-icon-menstrual-bleeding-vaginal-discharge-female-health-disorder-isolated-vector-175565299.jpg',
      text1: 'Vaginal Discharge',
    ),
    const Symptoms(
      id: '23',
      imageUrl:
          'https://cdn2.vectorstock.com/i/1000x1000/10/21/confused-young-woman-thinking-of-irregular-periods-vector-24011021.jpg',
      text1: 'Irregular Periods',
    ),
    const Symptoms(
      id: '24',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2D04De9irJrPzm2Vsf2TTKr3ruiqzzTTiRfvQPslq0A&s',
      text1: 'Constipation',
    ),
    const Symptoms(
      id: '25',
      imageUrl:
          'https://cdn.iconscout.com/icon/premium/png-256-thumb/painful-anus-1660129-1409764.png',
      text1: 'Piles',
    ),
    const Symptoms(
      id: '26',
      imageUrl:
          'https://cdn.iconscout.com/icon/premium/png-256-thumb/jaundice-5998548-5028230.png',
      text1: 'Jaundice',
    ),
    const Symptoms(
      id: '27',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThZNH-kDlQm9RxU9QdfMBtLysFqfRfUoRHRVVFGpezzw&s',
      text1: 'Premature Ejaculation',
    ),
    const Symptoms(
      id: '28',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf2gsYhw-UIFbdqGY1yR6gxHrMa1_PyOI0HaHi3eTqvw&s',
      text1: 'Urinary Tract Infection',
    ),
    const Symptoms(
      id: '29',
      imageUrl: 'https://rb.gy/tjlumb',
      text1: 'Sexual Disorders',
    ),
    const Symptoms(
      id: '30',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWLkp_VXugUEoUx8VuwaShY08iyjwFUxrMZyIovmNO0A&s',
      text1: 'Autism',
    ),
    const Symptoms(
      id: '31',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1491/1491394.png',
      text1: 'Schizophrenia',
    ),
    const Symptoms(
      id: '32',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7CmPXRU6E7A366r53Of2aj99JAih7GiwvVaCmlbH5zw&s',
      text1: 'Bipolar Disorder',
    ),
    const Symptoms(
      id: '33',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcoJ-hsHrNuR_ipn1_ogRIe73KWR-WbfXEsDQP67OaXw&s',
      text1: 'Panic Attack',
    ),
    const Symptoms(
      id: '34',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/7451/7451027.png',
      text1: 'Obesity',
    ),
    const Symptoms(
      id: '35',
      imageUrl:
          'https://www.shutterstock.com/image-vector/decreased-blurred-vision-icon-vector-260nw-2145990567.jpg',
      text1: 'Blurry Vision',
    ),
    const Symptoms(
      id: '36',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/4593/4593037.png',
      text1: 'Lethargy',
    ),
  ];

  @override
  List<Object?> get props => [imageUrl, text1];
}
