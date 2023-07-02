import 'package:my_note/app/core/model/note.dart';
import 'package:realm/realm.dart';

class RealmClient {
  RealmClient._privateConstructor();

  static final RealmClient _instance = RealmClient._privateConstructor();

  static RealmClient get instance => _instance;

  Realm getRealm() {
    final config = Configuration.local([Note.schema]);
    final realm = Realm(config);
    return realm;
  }
}
