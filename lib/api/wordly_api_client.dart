import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

part 'wordly_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class WordlyApiClient {
  factory WordlyApiClient(Dio dio, {String baseUrl}) = _WordlyApiClient;

  factory WordlyApiClient.create({String? apiUrl, Talker? talker, String? token}) {
    final dio = Dio();

    
    dio.interceptors.add(TalkerDioLogger(talker: talker));

    
    if (token != null) {
      dio.options.headers['Authorization'] = 'x-api-token $token';
    }

    
    if (apiUrl != null) {
      return WordlyApiClient(dio, baseUrl: apiUrl);
    }
    return WordlyApiClient(dio);
  }
}
