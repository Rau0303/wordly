import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:wordly/api/api.dart';
import 'package:wordly/app/app.dart';
import 'package:wordly/repositories/wordly/wordly.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final apiUrl = dotenv.env['API_URL'];
  final token = dotenv.env['STATIC_API_TOKEN'];
  

  final prefs = await _initPrefs();


  final realmConfig = Configuration.local([WordlyLocal.schema]);
  final realm = Realm(realmConfig);


  final apiClient = WordlyApiClient.create(
    apiUrl: apiUrl,
    talker: talker,
    token: token,
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: TalkerBlocLoggerSettings(
      printEventFullData: false,
      printStateFullData: false,
    ),
  );

  final config = AppConfig(
    preferences: prefs,
    realm: realm,
    talker: talker,
    apiClient: apiClient,
  );

  runApp(WordlyApp(config: config));
}

final talker = TalkerFlutter.init(
  settings: TalkerSettings(useConsoleLogs: kDebugMode, useHistory: kDebugMode),
);

Future<SharedPreferences> _initPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}
