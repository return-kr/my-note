import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/app/core/enum/edit_mode.dart';
import 'package:my_note/app/core/model/note.dart';
import 'package:my_note/app/core/utils/app_extensions.dart';
import 'package:my_note/app/core/utils/helper.dart';
import 'package:my_note/app/data/local/realm_dao.dart';

class EditNoteController extends GetxController {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final RealmDao _dao = Get.find();
  EditMode editMode = EditMode.CREATE_NEW;
  late Note note;
  late int index;

  @override
  void onInit() {
    editMode = Get.arguments[0];
    switch (editMode) {
      case EditMode.EDIT:
        note = Get.arguments[1];
        index = Get.arguments[2];
        initTextFields();
        break;
      case EditMode.CREATE_NEW:
        break;
    }
    super.onInit();
  }

  String getAppBarTitle(BuildContext context) {
    switch (editMode) {
      case EditMode.EDIT:
        return getLocale(context).editNote;
      case EditMode.CREATE_NEW:
        return getLocale(context).createNote;
    }
  }

  void onClickUndo() {
    initTextFields();
  }

  void onClickDelete(BuildContext context) {
    showConfirmDialog(
      context,
      title: getLocale(context).deleteNote,
      content: getLocale(context).sureDeleteNote,
      onYes: () {
        deleteNote();
        Get
          ..back()
          ..back();
      },
    );
  }

  void initTextFields() {
    titleController.text = note.title;
    bodyController.text = note.body;
  }

  Future<bool> onWillPop(BuildContext context) async {
    switch (editMode) {
      case EditMode.EDIT:
        editNote(context);
        return true;
      case EditMode.CREATE_NEW:
        createNote();
        return true;
    }
  }

  bool isNoteEmpty() {
    return (titleController.text.trim().isEmpty &&
        bodyController.text.trim().isEmpty);
  }

  void createNote() {
    if (isNoteEmpty()) {
      Get.back();
    } else {
      _dao.insertNewNote(
        Note(
          titleController.text,
          bodyController.text,
          DateTime.now().toString(),
        ),
      );
      Get.back();
    }
  }

  void deleteNote() {
    _dao.deleteNote(note);
  }

  void editNote(BuildContext context) {
    if (isNoteEmpty()) {
      onClickDelete(context);
    } else if (note.title != titleController.text ||
        note.body != bodyController.text) {
      _dao.updateNote(
        note: note,
        lastEdited: DateTime.now().toString(),
        title: titleController.text,
        body: bodyController.text,
      );
      Get.back();
    } else {
      Get.back();
    }
  }
}
