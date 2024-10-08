import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final double latitude;
  final double longitude;
  final String clinicAddress;
  final String address;
  final String image;
  final String name;
  final String experience;
  final String phoneNo;
  final String id;
  final String degree;
  final String speciality;
  final double bookingFees;

  const Doctor({
    required this.latitude,
    required this.longitude,
    required this.clinicAddress,
    required this.experience,
    required this.image,
    required this.address,
    required this.name,
    required this.phoneNo,
    required this.id,
    required this.degree,
    required this.speciality,
    required this.bookingFees,
  });

  static List<Doctor> doctors = [
    // Original 20 doctors
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '123, Central Town, Jalandhar',
      address: 'Central Town',
      id: '1',
      image: 'https://shorturl.at/lLMQ8',
      name: "Dr. Veena Mattu",
      phoneNo: '+919464332899',
      degree: 'MBBS, F.E.M-RCGP(UK)',
      speciality: 'General Physician',
      bookingFees: 700,
      experience: '14 Years of Experience',
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '456, Nakodar Chownk, Jalandhar',
      address: 'Nakodar Chownk',
      image: "https://shorturl.at/nsOW0",
      experience: '8 Years of Experience',
      name: "Dr. Pawan Kumar Singh",
      phoneNo: "+919780110211",
      id: '2',
      degree: 'degree',
      speciality: 'MBBS',
      bookingFees: 300,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '789, BMC Chownk, Jalandhar',
      address: 'BMC Chownk',
      experience: '11 years of Experience',
      image: "https://shorturl.at/fhnpJ",
      name: "Dr Piyush Gulabrao Nikam",
      phoneNo: '+919780220321',
      id: '3',
      degree:
          "MBBS, MS - General Surgery, Fellowship in Minimal Access Surgery",
      speciality: "General Surgeon",
      bookingFees: 400,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '101, Guru Nanak Mission Chownk, Jalandhar',
      address: 'Guru Nanak Mission Chownk',
      experience: '13 years of Experience',
      image: 'https://shorturl.at/ilsw5',
      name: 'Dr Sunakshi Singh',
      phoneNo: '+917814473219',
      id: '4',
      degree: "MD - Dermatology, MBBS",
      speciality: 'Dermatologist',
      bookingFees: 1000,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '567,Kapurthala Chowk, Jalandhar',
      address: 'Kapurthala Chowk',
      experience: '8 years of Experience',
      image: 'https://shorturl.at/dhjGX',
      name: 'Dr Naveen Kumar',
      phoneNo: '+917814473219',
      id: '5',
      degree: 'MBBS, MS - General Surgery',
      speciality: 'General Surgeon',
      bookingFees: 500,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '890, Rama Mandi, Jalandhar',
      address: 'Rama Mandi',
      experience: '20 years of Experience',
      image: 'https://rb.gy/hbdgi4',
      name: "Dr. Ridhi Narang",
      phoneNo: '+919872183234',
      id: '6',
      degree: 'M.B.B.S, MS - Obstetrics and Gynaecology',
      speciality: 'Gynaecologist',
      bookingFees: 400,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '321, Jalandhar Cantt, Jalandhar',
      address: 'Jalandhar Cantt',
      experience: '5 years of Experience',
      image: "https://rb.gy/a0fpna",
      name: 'Dr Tushar Goel',
      phoneNo: '+919874320984',
      id: "7",
      degree: 'MBBS, MS - General Surgery',
      speciality: "General Surgeon",
      bookingFees: 500,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '654, Model Town, Jalandhar ',
      address: 'Model Town',
      experience: '9 years of Experience',
      image: 'https://rb.gy/6ipwm5',
      name: 'Dr Amit Kumar Kushwaha',
      phoneNo: '+919780113743',
      id: '8',
      degree: 'MBBS, MS - General Surgery',
      speciality: 'General Surgeon',
      bookingFees: 400,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '501, Urban Estate, Jalandhar',
      address: 'Urban State',
      experience: "12 years of Experience",
      image: 'https://rb.gy/3owop0',
      name: 'Dr Amit Kukreti',
      phoneNo: '+919780220432',
      id: '9',
      degree: 'MBBS, MS - General Surgery',
      speciality: 'General Surgeon',
      bookingFees: 500,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '543, Adarsh Nagar, Jalandhar',
      address: 'Adarsh Nagar',
      experience: '7 years of Experience',
      image: 'https://rb.gy/be6z27',
      name: 'Dr Sanjeev Gupta',
      phoneNo: '+919780220345',
      id: '10',
      degree: 'MBBS, MS - General Surgery',
      speciality: 'General Surgeon',
      bookingFees: 500,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '540, Green Model Town, Jalandhar',
      address: 'Green Model Town',
      experience: '6 years of Experience',
      image: "https://t.ly/JGJ7U",
      name: "Dr. N A Khan",
      phoneNo: '+919780220342',
      id: '11',
      degree: "Doctor In Unani Medicine(D.U.M.B.I.M)",
      speciality: "Sexologist",
      bookingFees: 500,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '5430, Kishanpura, Jalandhar',
      address: 'Kishanpura',
      experience: '10 years of Experience',
      image: 'https://t.ly/ykyuC',
      name: 'Dr. Yuvraj Arora Monga',
      phoneNo: "+919783298345",
      id: '12',
      degree: 'MBBS, MD - Pharmacology',
      speciality: "Sexologist",
      bookingFees: 800,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '23, Basti Sheikh, Jalandhar',
      address: 'Basti Sheikh',
      experience: '4 years of Experience',
      image: "https://t.ly/rC8BW",
      name: "Dr. Pooja Anand Sharma",
      phoneNo: "+917801104328",
      id: '13',
      degree: "Ph.D - Psychology, M.Sc. - Counselling and Psychotherapy",
      speciality: "Psychologist",
      bookingFees: 2000,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '233, Shaheed Udham Singh Nagar, Jalandhar',
      address: 'Shaheed Udham Singh Nagar',
      experience: '8 years of Experience',
      image: "https://t.ly/EF9sj",
      name: "Dr. Vikas Khanna",
      phoneNo: "+919654398765",
      id: '14',
      degree: "BDS, Certification In Hypnotherapy",
      speciality: "Psychologist",
      bookingFees: 1800,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '203, Civil Lines, Jalandhar',
      address: 'Civil Lines',
      experience: '3 years of Experience',
      image: "https://t.ly/4Wuya",
      name: "Dr. Nisha Khanna",
      phoneNo: "+917089321754",
      id: "15",
      degree: "Ph. D - Psychology",
      speciality: "Psychologist",
      bookingFees: 6000,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '203, Maqsudan, Jalandhar',
      address: 'Maqsudan',
      experience: '3 years of Experience',
      image: "https://rb.gy/hy5ffg",
      name: "Dr. Swarnshikha Sharma",
      phoneNo: '+918790890987',
      id: '16',
      degree: "Doctorate In Dietetics, PhD - Psychology",
      speciality: "Dietitian/Nutritionist",
      bookingFees: 400,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '98, Avtar Nagar, Jalandhar',
      address: 'Avtar Nagar',
      experience: '12 years of Experience',
      image: "https://rb.gy/263ei0",
      name: 'Dt. Ritika Dua',
      phoneNo: '+919782134590',
      id: '17',
      degree: 'BSc-Diet & Nutrition, M.Sc-Diet & Nutrition',
      speciality: 'Dietitian/Nutritionist',
      bookingFees: 1000,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '928, Shaheed Bhagat Singh Nagar, Jalandhar',
      address: 'Shaheed Bhagat Singh Nagar',
      experience: '6 years of Experience',
      image: 'https://rb.gy/nv14j7',
      name: 'Dr. Vikas Yadav',
      phoneNo: "+917807432876",
      id: '18',
      degree: 'BDS',
      speciality: 'Dentist',
      bookingFees: 200,
    ),
    const Doctor(
      latitude: 30.715761,
      longitude: 76.763459,
      clinicAddress: '78, Guru Gobind Singh Nagar, Jalandhar',
      address: 'Guru Gobind Singh Nagar',
      experience: '9 years of Experience',
      image: 'https://rb.gy/r2pmnd',
      name: 'Dr. Sandeep Kumar Jangra',
      phoneNo: '+917865439876',
      id: '19',
      degree: 'MDS - Orthodontics, BDS, Certified Implantologist',
      speciality: 'Dentist',
      bookingFees: 500,
    ),
    const Doctor(
      latitude: 30.717273,
      longitude: 76.778050,
      clinicAddress: '378, Lajpat Nagar, Jalandhar',
      address: 'Lajpat Nagar',
      experience: '4 years of Experience',
      image: 'https://rb.gy/1nvd30',
      name: 'Dr. Ashok Yadav',
      phoneNo: '+919654588765',
      id: '20',
      degree: 'MDS - Orthodontics, BDS',
      speciality: 'Dentist',
      bookingFees: 300,
    ),

    // Additional 20 doctors
    const Doctor(
      latitude: 30.718200,
      longitude: 76.779900,
      clinicAddress: '234, Model House, Jalandhar',
      address: 'Model House',
      experience: '10 years of Experience',
      image: 'https://rb.gy/abcd12',
      name: 'Dr. Richa Sharma',
      phoneNo: '+919876543210',
      id: '21',
      degree: 'MBBS, MD - Dermatology',
      speciality: 'Dermatologist',
      bookingFees: 800,
    ),
    const Doctor(
      latitude: 30.719500,
      longitude: 76.780500,
      clinicAddress: '567, Friends Colony, Jalandhar',
      address: 'Friends Colony',
      experience: '15 years of Experience',
      image: 'https://rb.gy/abcd34',
      name: 'Dr. Manoj Verma',
      phoneNo: '+919876543211',
      id: '22',
      degree: 'MBBS, MD - General Medicine',
      speciality: 'General Physician',
      bookingFees: 600,
    ),
    const Doctor(
      latitude: 30.720300,
      longitude: 76.781200,
      clinicAddress: '789, Golden Avenue, Jalandhar',
      address: 'Golden Avenue',
      experience: '12 years of Experience',
      image: 'https://rb.gy/abcd56',
      name: 'Dr. Priya Malhotra',
      phoneNo: '+919876543212',
      id: '23',
      degree: 'MBBS, MS - ENT',
      speciality: 'ENT Specialist',
      bookingFees: 700,
    ),
    const Doctor(
      latitude: 30.721000,
      longitude: 76.781900,
      clinicAddress: '890, Urban Estate Phase II, Jalandhar',
      address: 'Urban Estate Phase II',
      experience: '18 years of Experience',
      image: 'https://rb.gy/abcd78',
      name: 'Dr. Sanjay Gupta',
      phoneNo: '+919876543213',
      id: '24',
      degree: 'MBBS, MS - Orthopedics',
      speciality: 'Orthopedic',
      bookingFees: 900,
    ),
    const Doctor(
      latitude: 30.721800,
      longitude: 76.782600,
      clinicAddress: '234, Choti Baradari, Jalandhar',
      address: 'Choti Baradari',
      experience: '20 years of Experience',
      image: 'https://rb.gy/abcd90',
      name: 'Dr. Sunita Kapoor',
      phoneNo: '+919876543214',
      id: '25',
      degree: 'MBBS, MD - Pediatrics',
      speciality: 'Pediatrician',
      bookingFees: 500,
    ),
    const Doctor(
      latitude: 30.722600,
      longitude: 76.783300,
      clinicAddress: '567, Cantt Road, Jalandhar',
      address: 'Cantt Road',
      experience: '7 years of Experience',
      image: 'https://rb.gy/abcd11',
      name: 'Dr. Ramesh Singh',
      phoneNo: '+919876543215',
      id: '26',
      degree: 'MBBS, MS - Urology',
      speciality: 'Urologist',
      bookingFees: 1000,
    ),
    const Doctor(
      latitude: 30.723300,
      longitude: 76.784000,
      clinicAddress: '789, Defence Colony, Jalandhar',
      address: 'Defence Colony',
      experience: '25 years of Experience',
      image: 'https://rb.gy/abcd22',
      name: 'Dr. Kamal Kaur',
      phoneNo: '+919876543216',
      id: '27',
      degree: 'MBBS, MS - Cardiology',
      speciality: 'Cardiologist',
      bookingFees: 1200,
    ),
    const Doctor(
      latitude: 30.724100,
      longitude: 76.784700,
      clinicAddress: '890, Gopal Nagar, Jalandhar',
      address: 'Gopal Nagar',
      experience: '5 years of Experience',
      image: 'https://rb.gy/abcd33',
      name: 'Dr. Ashok Mehta',
      phoneNo: '+919876543217',
      id: '28',
      degree: 'MBBS, MS - Neurology',
      speciality: 'Neurologist',
      bookingFees: 1500,
    ),
    const Doctor(
      latitude: 30.724900,
      longitude: 76.785400,
      clinicAddress: '234, Jawahar Nagar, Jalandhar',
      address: 'Jawahar Nagar',
      experience: '13 years of Experience',
      image: 'https://rb.gy/abcd44',
      name: 'Dr. Seema Sharma',
      phoneNo: '+919876543218',
      id: '29',
      degree: 'MBBS, MD - Oncology',
      speciality: 'Oncologist',
      bookingFees: 1100,
    ),
    const Doctor(
      latitude: 30.725600,
      longitude: 76.786100,
      clinicAddress: '567, Lajpat Nagar, Jalandhar',
      address: 'Lajpat Nagar',
      experience: '10 years of Experience',
      image: 'https://rb.gy/abcd55',
      name: 'Dr. Deepak Chopra',
      phoneNo: '+919876543219',
      id: '30',
      degree: 'MBBS, MS - Pulmonology',
      speciality: 'Pulmonologist',
      bookingFees: 800,
    ),
    const Doctor(
      latitude: 30.726400,
      longitude: 76.786800,
      clinicAddress: '789, Adarsh Nagar, Jalandhar',
      address: 'Adarsh Nagar',
      experience: '14 years of Experience',
      image: 'https://rb.gy/abcd66',
      name: 'Dr. Priyanka Sharma',
      phoneNo: '+919876543220',
      id: '31',
      degree: 'MBBS, MD - Nephrology',
      speciality: 'Nephrologist',
      bookingFees: 1000,
    ),
    const Doctor(
      latitude: 30.727200,
      longitude: 76.787500,
      clinicAddress: '890, Ranjit Avenue, Jalandhar',
      address: 'Ranjit Avenue',
      experience: '8 years of Experience',
      image: 'https://rb.gy/abcd77',
      name: 'Dr. Mohit Verma',
      phoneNo: '+919876543221',
      id: '32',
      degree: 'MBBS, MS - Ophthalmology',
      speciality: 'Ophthalmologist',
      bookingFees: 900,
    ),
    const Doctor(
      latitude: 30.728000,
      longitude: 76.788200,
      clinicAddress: '234, Shastri Nagar, Jalandhar',
      address: 'Shastri Nagar',
      experience: '9 years of Experience',
      image: 'https://rb.gy/abcd88',
      name: 'Dr. Anita Sethi',
      phoneNo: '+919876543222',
      id: '33',
      degree: 'MBBS, MS - Gynecology',
      speciality: 'Gynecologist',
      bookingFees: 1100,
    ),
    const Doctor(
      latitude: 30.728700,
      longitude: 76.788900,
      clinicAddress: '567, Tagore Nagar, Jalandhar',
      address: 'Tagore Nagar',
      experience: '11 years of Experience',
      image: 'https://rb.gy/abcd99',
      name: 'Dr. Rajeev Kapoor',
      phoneNo: '+919876543223',
      id: '34',
      degree: 'MBBS, MD - Psychiatry',
      speciality: 'Psychiatrist',
      bookingFees: 1300,
    ),
    const Doctor(
      latitude: 30.729500,
      longitude: 76.789600,
      clinicAddress: '789, Sant Nagar, Jalandhar',
      address: 'Sant Nagar',
      experience: '6 years of Experience',
      image: 'https://rb.gy/abce10',
      name: 'Dr. Kavita Verma',
      phoneNo: '+919876543224',
      id: '35',
      degree: 'MBBS, MD - Pathology',
      speciality: 'Pathologist',
      bookingFees: 700,
    ),
    const Doctor(
      latitude: 30.730300,
      longitude: 76.790300,
      clinicAddress: '890, Milan Palace, Jalandhar',
      address: 'Milan Palace',
      experience: '19 years of Experience',
      image: 'https://rb.gy/abce11',
      name: 'Dr. Rohit Khanna',
      phoneNo: '+919876543225',
      id: '36',
      degree: 'MBBS, MS - Rheumatology',
      speciality: 'Rheumatologist',
      bookingFees: 1400,
    ),
    const Doctor(
      latitude: 30.731100,
      longitude: 76.791000,
      clinicAddress: '234, Green Fields, Jalandhar',
      address: 'Green Fields',
      experience: '12 years of Experience',
      image: 'https://rb.gy/abce12',
      name: 'Dr. Meena Sharma',
      phoneNo: '+919876543226',
      id: '37',
      degree: 'MBBS, MS - Endocrinology',
      speciality: 'Endocrinologist',
      bookingFees: 1200,
    ),
    const Doctor(
      latitude: 30.731800,
      longitude: 76.791700,
      clinicAddress: '567, Urban Estate Phase I, Jalandhar',
      address: 'Urban Estate Phase I',
      experience: '17 years of Experience',
      image: 'https://rb.gy/abce13',
      name: 'Dr. Rajat Kapoor',
      phoneNo: '+919876543227',
      id: '38',
      degree: 'MBBS, MS - Gastroenterology',
      speciality: 'Gastroenterologist',
      bookingFees: 1500,
    ),
    const Doctor(
      latitude: 30.732600,
      longitude: 76.792400,
      clinicAddress: '789, Ranjit Avenue, Jalandhar',
      address: 'Ranjit Avenue',
      experience: '7 years of Experience',
      image: 'https://rb.gy/abce14',
      name: 'Dr. Neha Chopra',
      phoneNo: '+919876543228',
      id: '39',
      degree: 'MBBS, MS - Plastic Surgery',
      speciality: 'Plastic Surgeon',
      bookingFees: 1700,
    ),
    const Doctor(
      latitude: 30.733400,
      longitude: 76.793100,
      clinicAddress: '890, Defence Colony, Jalandhar',
      address: 'Defence Colony',
      experience: '16 years of Experience',
      image: 'https://rb.gy/abce15',
      name: 'Dr. Arvind Kumar',
      phoneNo: '+919876543229',
      id: '40',
      degree: 'MBBS, MS - Neurosurgery',
      speciality: 'Neurosurgeon',
      bookingFees: 1600,
    ),
  ];

  @override
  List<Object?> get props => [
        image,
        name,
        phoneNo,
        id,
        degree,
        speciality,
        bookingFees,
      ];
}
