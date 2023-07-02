import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/app/core/enum/edit_mode.dart';
import 'package:my_note/app/core/utils/app_extensions.dart';
import 'package:my_note/app/core/utils/helper.dart';
import 'package:my_note/app/data/local/realm_dao.dart';
import 'package:my_note/app/modules/home/controllers/note_list_flow_controller.dart';
import 'package:my_note/app/routes/app_pages.dart';
import 'package:realm/realm.dart';

import '../../../core/model/note.dart';

class HomeController extends GetxController {
  final RealmDao _dao = Get.find();
  late RealmResults<Note> allNotes;
  final isProgress = false.obs;
  final updateNotes = NoteListFlowController.instance.updateNote;
  final notes = NoteListFlowController.instance.notes;
  final isListEmpty = true.obs;

  @override
  void onInit() {
    getAllNotes();
    super.onInit();
  }

  void onClickDelete(BuildContext context) {
    showConfirmDialog(
      context,
      title: getLocale(context).deleteNotes,
      content: getLocale(context).sureDeleteAllNotes,
      onYes: () {
        _dao.deleteAllNotes();
        Get.back();
        getAllNotes();
      },
    );
  }

  void getAllNotes() async {
    isProgress.value = true;
    allNotes = _dao.getAllNotes();
    isListEmpty.value = allNotes.isEmpty;
    updateNotes.add(allNotes);
    isProgress.value = false;
  }

  void onClickNote(Note value, int index) {
    Get.toNamed(Routes.EDIT_NOTE, arguments: [EditMode.EDIT, value, index]);
  }

  void onClickAddNote() {
    Get.toNamed(Routes.EDIT_NOTE, arguments: [EditMode.CREATE_NEW]);
  }

  Future<bool> onWillPop(BuildContext context) async {
    showConfirmDialog(
      context,
      title: 'Exit?',
      content: 'Are you sure want to exit My Notes?',
      onYes: () {
        return true;
      },
    );
    return false;
  }
}
