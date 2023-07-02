import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

import 'package:get/get.dart';
import 'package:my_note/app/core/utils/app_extensions.dart';
import 'package:my_note/app/core/utils/helper.dart';
import 'package:my_note/app/core/utils/text_styles.dart';
import 'package:my_note/app/core/widget/app_bar.dart';
import 'package:my_note/app/core/widget/sizedbox.dart';
import 'package:my_note/app/modules/home/views/note_list_view.dart';
import 'package:realm/realm.dart';

import '../../../core/model/note.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        controller.getAllNotes();
      },
      child: WillPopScope(
        onWillPop: () => controller.onWillPop(context),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Obx(
              () => CommonAppBar(
                title: getLocale(context).appName,
                isDelete: !controller.isListEmpty.value,
                onPressDelete: () {
                  controller.onClickDelete(context);
                },
              ),
            ),
          ),
          floatingActionButton: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              controller.onClickAddNote();
            },
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 23,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          body: SafeArea(
            child: SizedBox(
              height: 100.h(context) -
                  (kToolbarHeight + kBottomNavigationBarHeight),
              width: double.infinity,
              child: Column(
                children: [
                  verticalSpacing(10),
                  Expanded(
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: (controller.isProgress.value)
                            ? CupertinoActivityIndicator(
                                color: Colors.green,
                              )
                            : controller.isListEmpty.value
                                ? Center(
                                    child: Text(
                                      getLocale(context).noNotes,
                                      style: headingTextStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                  )
                                : StreamBuilder<RealmResults<Note>>(
                                    stream: controller.notes,
                                    builder: (context, snapshot) {
                                      return ListView.separated(
                                        itemCount: snapshot.data?.length ?? 0,
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          final note = snapshot.data![index];
                                          return NoteListView(
                                            title: note.title,
                                            lastEdited: note.lastEdited,
                                            body: note.body,
                                            onClick: () {
                                              controller.onClickNote(
                                                note,
                                                index,
                                              );
                                            },
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            thickness: 1,
                                            color: Colors.cyan.withOpacity(0.3),
                                            height: 30,
                                          );
                                        },
                                      );
                                    },
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
