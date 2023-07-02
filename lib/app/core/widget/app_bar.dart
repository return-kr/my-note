import 'package:flutter/material.dart';
import 'package:my_note/app/core/utils/app_extensions.dart';
import 'package:my_note/app/core/utils/text_styles.dart';
import 'package:my_note/app/core/widget/sizedbox.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.title = "",
    this.onPressBack,
    this.onPressDelete,
    this.onPressUndo,
    this.isBack = false,
    this.isDelete = false,
    this.isUndo = false,
    this.centerTitle = true,
  });
  final String title;
  final Function? onPressBack;
  final Function? onPressUndo;
  final Function? onPressDelete;
  final bool isBack;
  final bool isUndo;
  final bool isDelete;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 10,
      leadingWidth: 65,
      shadowColor: Colors.black.withOpacity(0.10),
      actions: [
        Visibility(
          visible: isUndo,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              if (onPressUndo != null) {
                onPressUndo!();
              }
            },
            child: Icon(
              Icons.undo_rounded,
              color: Colors.green,
            ),
          ),
        ),
        horizontalSpacing(40),
        Visibility(
          visible: isDelete,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              if (onPressDelete != null) {
                onPressDelete!();
              }
            },
            child: Icon(
              Icons.delete_forever_outlined,
              color: Colors.red[900],
            ),
          ),
        ),
        horizontalSpacing(12),
      ],
      leading: Visibility(
        visible: isBack,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            if (onPressBack != null) {
              onPressBack!();
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                0.5.horizontal(context),
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: headingTextStyle.copyWith(),
      ),
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
