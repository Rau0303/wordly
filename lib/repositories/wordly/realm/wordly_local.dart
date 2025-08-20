import 'package:realm/realm.dart';

part 'wordly_local.realm.dart';

@RealmModel()
class _WordlyLocal{
  @PrimaryKey()
  late String uid;
  late String query;
  late List<String> words;
}