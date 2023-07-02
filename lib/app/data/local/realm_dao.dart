import 'package:my_note/app/core/model/note.dart';
import 'package:my_note/app/data/local/realm_client.dart';
import 'package:realm/realm.dart';

abstract class RealmDao {
  RealmResults<Note> getAllNotes();
  void insertNewNote(Note note);
  void updateNote({
    required Note note,
    required String lastEdited,
    required String title,
    required String body,
  });
  void deleteNote(Note note);
  void deleteAllNotes();
}

class RealmDaoImpl extends RealmDao {
  final Realm _client = RealmClient.instance.getRealm();
  @override
  RealmResults<Note> getAllNotes() {
    final notes = _client.all<Note>();
    return notes;
  }

  @override
  void insertNewNote(Note note) {
    _client.write(
      () => _client.add(note),
    );
  }

  @override
  void updateNote({
    required Note note,
    required String lastEdited,
    required String title,
    required String body,
  }) {
    _client.write(() {
      note.title = title;
      note.body = body;
      note.lastEdited = lastEdited;
    });
  }

  @override
  void deleteNote(Note note) {
    _client.write(
      () => _client.delete(note),
    );
  }

  @override
  void deleteAllNotes() {
    _client.write(
      () => _client.deleteAll<Note>(),
    );
  }
}
