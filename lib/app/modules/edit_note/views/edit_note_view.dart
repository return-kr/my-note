import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_note/app/core/enum/edit_mode.dart';
import 'package:my_note/app/core/utils/app_extensions.dart';
import 'package:my_note/app/core/utils/helper.dart';
import 'package:my_note/app/core/utils/text_styles.dart';
import 'package:my_note/app/core/widget/app_bar.dart';
import 'package:my_note/app/core/widget/sizedbox.dart';
import 'package:my_note/app/core/widget/text_field.dart';

import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  const EditNoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.onWillPop(context),
      child: Scaffold(
        appBar: CommonAppBar(
          title: controller.getAppBarTitle(context),
          isBack: true,
          isUndo: controller.editMode == EditMode.EDIT,
          isDelete: controller.editMode == EditMode.EDIT,
          centerTitle: false,
          onPressBack: () {
            controller.onWillPop(context);
          },
          onPressUndo: () {
            controller.onClickUndo();
          },
          onPressDelete: () {
            controller.onClickDelete(context);
          },
        ),
        body: SafeArea(
          child: SizedBox(
            height:
                100.h(context) - (kToolbarHeight + kBottomNavigationBarHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
                Scrollbar(
                  child: CommonTextField(
                    controller: controller.titleController,
                    placeholder: getLocale(context).title,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    style: listTitleTextStyle.copyWith(
                      fontSize: 24,
                    ),
                    placeholderStyle: listTitleTextStyle.copyWith(
                        fontSize: 24, color: Colors.black.withOpacity(0.2)),
                  ),
                ),
                verticalSpacing(20),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: CommonTextField(
                        controller: controller.bodyController,
                        minLines: null,
                        maxLines: null,
                        expands: true,
                        placeholder: getLocale(context).note,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        style: bodyTextStyle.copyWith(
                          fontSize: 18,
                        ),
                        placeholderStyle: bodyTextStyle.copyWith(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
