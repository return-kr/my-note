import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/app/core/widget/confirm_dialog.dart';

extension DynamicFontSizeOnInt on int {
  double sp(BuildContext context) {
    return MediaQuery.of(context).size.width / 4.3 * this / 100;
  }
}

extension DynamicFontSizeOnDouble on double {
  double sp(BuildContext context) {
    return MediaQuery.of(context).size.width / 4.3 * this / 100;
  }
}

extension HeightPercentOnInt on int {
  double h(BuildContext context) {
    return MediaQuery.of(context).size.height * this / 100;
  }
}

extension HeightPercentOnDouble on double {
  double h(BuildContext context) {
    return MediaQuery.of(context).size.height * this / 100;
  }
}

extension WidthercentOnInt on int {
  double w(BuildContext context) {
    return MediaQuery.of(context).size.width * this / 100;
  }
}

extension WidthercentOnDouble on double {
  double w(BuildContext context) {
    return MediaQuery.of(context).size.width * this / 100;
  }
}

extension HorizontalSizedBox on int {
  Widget horizon(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * this / 100,
    );
  }
}

extension VerticalSizedBox on int {
  Widget vertical(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * this / 100,
    );
  }
}

extension HorizontalSizedBoxOnDouble on double {
  Widget horizontal(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * this / 100,
    );
  }
}

extension VerticalSizedBoxOnDouble on double {
  Widget vertical(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * this / 100,
    );
  }
}

extension ShowDialog on GetxController {
  showConfirmDialog(
    BuildContext context, {
    String title = "",
    String content = "",
    Function? onYes,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: title,
          content: content,
          onYes: onYes,
        );
      },
    );
  }
}
