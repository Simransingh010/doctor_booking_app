import 'package:equatable/equatable.dart';

class CarouselLogin extends Equatable {
  final String iconUrl;
  final String text2;
  final String id;

  const CarouselLogin({
    required this.iconUrl,
    required this.text2,
    required this.id,
  });

  static List<CarouselLogin> loginData = [
    CarouselLogin(
        id: '1',
        iconUrl: 'assets/Images/image1.png',
        text2: 'Video consult top Doctors From the Comfort Of Your Home'),
    CarouselLogin(
        id: '2',
        iconUrl: 'assets/Images/image2.png',
        text2:
            'Read Patient\'s Stories and Book all the Doctor Appointments from your Home '),
    CarouselLogin(
        id: '3',
        iconUrl: 'assets/Images/image3.png',
        text2: 'Get upto 25% off on medicines, Health and Wellness Products'),
    CarouselLogin(
        id: '4',
        iconUrl: 'assets/Images/image4.png',
        text2:
            '1 Crore Indians connect with Doctors every year on HealthMate!'),
  ];
  @override
  // TODO: implement props
  List<Object?> get props => [
        iconUrl,
        text2,
        id,
      ];
}
