import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_note/app/core/utils/app_extensions.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    return Scaffold(
      body: Container(
        height: 100.h(context),
        width: 100.w(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.2, 1.2),
            colors: [
              Colors.green,
              Colors.cyan,
            ],
          ),
        ),
      ),
    );
  }
}
