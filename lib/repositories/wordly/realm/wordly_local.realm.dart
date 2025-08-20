// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordly_local.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class WordlyLocal extends _WordlyLocal
    with RealmEntity, RealmObjectBase, RealmObject {
  WordlyLocal(String uid, String query, {Iterable<String> words = const []}) {
    RealmObjectBase.set(this, 'uid', uid);
    RealmObjectBase.set(this, 'query', query);
    RealmObjectBase.set<RealmList<String>>(
      this,
      'words',
      RealmList<String>(words),
    );
  }

  WordlyLocal._();

  @override
  String get uid => RealmObjectBase.get<String>(this, 'uid') as String;
  @override
  set uid(String value) => RealmObjectBase.set(this, 'uid', value);

  @override
  String get query => RealmObjectBase.get<String>(this, 'query') as String;
  @override
  set query(String value) => RealmObjectBase.set(this, 'query', value);

  @override
  RealmList<String> get words =>
      RealmObjectBase.get<String>(this, 'words') as RealmList<String>;
  @override
  set words(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<WordlyLocal>> get changes =>
      RealmObjectBase.getChanges<WordlyLocal>(this);

  @override
  Stream<RealmObjectChanges<WordlyLocal>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<WordlyLocal>(this, keyPaths);

  @override
  WordlyLocal freeze() => RealmObjectBase.freezeObject<WordlyLocal>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'uid': uid.toEJson(),
      'query': query.toEJson(),
      'words': words.toEJson(),
    };
  }

  static EJsonValue _toEJson(WordlyLocal value) => value.toEJson();
  static WordlyLocal _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {'uid': EJsonValue uid, 'query': EJsonValue query} => WordlyLocal(
        fromEJson(uid),
        fromEJson(query),
        words: fromEJson(ejson['words']),
      ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(WordlyLocal._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      WordlyLocal,
      'WordlyLocal',
      [
        SchemaProperty('uid', RealmPropertyType.string, primaryKey: true),
        SchemaProperty('query', RealmPropertyType.string),
        SchemaProperty(
          'words',
          RealmPropertyType.string,
          collectionType: RealmCollectionType.list,
        ),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
