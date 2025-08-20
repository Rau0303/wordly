import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker/talker.dart';
import 'package:wordly/api/wordly_api_client.dart';

class AppConfig {
  AppConfig({
    required this.preferences,
    required this.realm,
    required this.talker,
    required this.apiClient,
  });

  
  final SharedPreferences preferences;
  final Realm realm;
  final Talker talker;
  final WordlyApiClient apiClient;
}
