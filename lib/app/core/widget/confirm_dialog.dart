import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_note/app/core/utils/helper.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    this.title = "",
    this.content = "",
    this.onYes,
  });

  final String title;
  final String content;
  final Function? onYes;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(getLocale(context).sure),
          onPressed: () {
            if (onYes != null) {
              onYes!();
            }
          },
        ),
        CupertinoDialogAction(
          child: Text(getLocale(context).nope),
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }
}
