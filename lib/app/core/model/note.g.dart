// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Note extends _Note with RealmEntity, RealmObjectBase, RealmObject {
  Note(
    String title,
    String body,
    String lastEdited,
  ) {
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'body', body);
    RealmObjectBase.set(this, 'lastEdited', lastEdited);
  }

  Note._();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get body => RealmObjectBase.get<String>(this, 'body') as String;
  @override
  set body(String value) => RealmObjectBase.set(this, 'body', value);

  @override
  String get lastEdited =>
      RealmObjectBase.get<String>(this, 'lastEdited') as String;
  @override
  set lastEdited(String value) =>
      RealmObjectBase.set(this, 'lastEdited', value);

  @override
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObjectBase.getChanges<Note>(this);

  @override
  Note freeze() => RealmObjectBase.freezeObject<Note>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Note._);
    return const SchemaObject(ObjectType.realmObject, Note, 'Note', [
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('body', RealmPropertyType.string),
      SchemaProperty('lastEdited', RealmPropertyType.string),
    ]);
  }
}
