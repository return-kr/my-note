import 'package:realm/realm.dart';
part 'note.g.dart';

@RealmModel()
class _Note {
  late String title;
  late String body;
  late String lastEdited;
}
