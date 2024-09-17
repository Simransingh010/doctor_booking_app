import 'package:doctor_booking_app/firebase%20login/auth_services.dart';
import 'package:doctor_booking_app/firebase%20login/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthService());
  final _userRepo = Get.put(UserRepository());

  Future<void> getUserData() async {
    final email = _authRepo.currentUser?.email;

    if (email != null) {
      try {
        final userData = await _userRepo.getUserDetails(email);
        // Do something with userData
      } catch (e) {
        Get.snackbar('Error', 'Failed to fetch user data');
      }
    } else {
      Get.snackbar('Error', 'Login to Continue');
    }
  }
}

//  if (email != null) {
//       return _userRepo.getUserDetails(email);
//     } else {
//       Get.snackbar('Eror', "Login to Continue");
//     }