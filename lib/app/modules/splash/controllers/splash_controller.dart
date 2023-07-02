import 'package:get/get.dart';
import 'package:my_note/app/routes/app_pages.dart';

class SplashController extends GetxController {
  void startTimer() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.offAllNamed(Routes.HOME);
      },
    );
  }
}
