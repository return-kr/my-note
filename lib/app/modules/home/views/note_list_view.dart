import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/text_styles.dart';
import '../../../core/widget/sizedbox.dart';

class NoteListView extends GetView {
  const NoteListView({
    Key? key,
    this.title,
    this.lastEdited,
    this.body,
    this.onClick,
  }) : super(key: key);
  final String? title;
  final String? lastEdited;
  final String? body;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            overflow: TextOverflow.visible,
            style: listTitleTextStyle,
          ),
          verticalSpacing(2),
          Text(
            lastEdited ?? '',
            style: listTimeTextStyle,
          ),
          verticalSpacing(6),
          Text(
            body ?? '',
            style: bodyTextStyle,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
