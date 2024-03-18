import 'package:equatable/equatable.dart';

class DrawerTile extends Equatable {
  final String titleText;
  final String imageUrl;
  final String id;
  final String navAddress;

  const DrawerTile({
    required this.imageUrl,
    required this.titleText,
    required this.id,
    required this.navAddress,
  });
  static List<DrawerTile> tiles = [
    DrawerTile(
        navAddress: 'AppointmentScreen()',
        imageUrl: 'assets/Images/appointments.png',
        titleText: 'Appointment',
        id: '1'),
    DrawerTile(
        navAddress: 'TestBooking()',
        imageUrl: 'assets/Images/testBooking.png',
        titleText: 'Test Bookings',
        id: '2'),
    DrawerTile(
      navAddress: 'OrderScreen()',
      imageUrl: 'assets/Images/orders.png',
      titleText: 'Orders',
      id: '3',
    ),
    DrawerTile(
        navAddress: 'ConsultationsScreen()',
        imageUrl: 'assets/Images/consultations.png',
        titleText: 'Consultants',
        id: '4'),
    DrawerTile(
        navAddress: 'ConsultationsScreen()',
        imageUrl: 'assets/Images/doctors.png',
        titleText: 'My Doctors',
        id: '5'),
    DrawerTile(
        navAddress: 'OrderScreen()',
        imageUrl: 'assets/Images/medicalRecords.png',
        titleText: 'Medical Records',
        id: '6'),
    DrawerTile(
        navAddress: 'TestBooking()',
        imageUrl: 'assets/Images/consultations.png',
        titleText: 'Insurance Policies',
        id: '7'),
    DrawerTile(
        navAddress: 'AppointmentScreen()',
        imageUrl: 'assets/Images/reminder.png',
        titleText: 'Reminders',
        id: '8'),
    DrawerTile(
        navAddress: 'AppointmentScreen()',
        imageUrl: 'assets/Images/payment.png',
        titleText: 'Payments and Cash',
        id: '9'),
    DrawerTile(
        navAddress: 'AppointmentScreen()',
        imageUrl: 'assets/Images/healthArticles.png',
        titleText: 'Read Health Articles',
        id: '10'),
    DrawerTile(
        navAddress: 'AppointmentScreen()',
        imageUrl: 'assets/Images/Helpcentre.png',
        titleText: 'Help Centre',
        id: '11'),
    DrawerTile(
        navAddress: 'AppointmentScreen()',
        imageUrl: 'assets/Images/settings.png',
        titleText: 'Settings',
        id: '12'),
    DrawerTile(
        navAddress: 'AppointmentScreen()',
        imageUrl: 'assets/Images/areuadoctor.png',
        titleText: 'Are You a Doctor?',
        id: '13'),
  ];

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        titleText,
      ];
}
  // const DrawerTile({
  //   super.key,
  //   required this.imageUrl,
  //   required this.titleText,
  // });
  // final String titleText;
  // final String imageUrl;
