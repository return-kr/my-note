import 'dart:async';

import 'package:my_note/app/core/model/note.dart';
import 'package:realm/realm.dart';
import 'package:rxdart/rxdart.dart';

class NoteListFlowController {
  NoteListFlowController._privateConstructor();

  static final NoteListFlowController _instance =
      NoteListFlowController._privateConstructor();

  static NoteListFlowController get instance => _instance;

  final _notes = BehaviorSubject<RealmResults<Note>>();
  Sink get updateNote => _notes.sink;
  Stream<RealmResults<Note>> get notes => _notes.stream;
}
