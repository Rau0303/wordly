import 'package:realm/realm.dart';
import 'package:wordly/api/wordly_api_client.dart';
import 'package:wordly/repositories/wordly/wordly.dart';


class WordlyRepository implements WordlyRepositoryI {
  WordlyRepository({required this.apiClient, required this.realm});

  final WordlyApiClient apiClient;
  final Realm realm;

  @override
  Future<List<String>> fetchWords(Wordly wordly) async {
    try {
      // 1. ищем в локальной базе
      final local = _searchLocal(wordly.query);
      if (local.isNotEmpty) {
        return local;
      }

      // 2. идём в API
      final response = await apiClient.fetchWords(wordly);

      // 3. сохраняем в локальную базу
      realm.write(() {
        realm.add(response.toLocal(), update: true);
      });

      return response.results;
    } catch (e, st) {
      /// TODO: нужно прописать кастомные ошибки в случае того что все уйдет не по плану
      /// думаю rethrow это раковая ошибка
      rethrow;
    }
  }

  List<String> _searchLocal(String query) {
    final results =
        realm.query<WordlyLocal>(r'query == $0', [query]).toList();
    if (results.isNotEmpty) {
      return results.first.words.toList();
    }
    return [];
  }
}
