import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:wordly/api/api.dart';
import 'package:wordly/repositories/wordly/wordly.dart';

part 'wordly_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class WordlyApiClient {
  factory WordlyApiClient(Dio dio, {String baseUrl}) = _WordlyApiClient;

  factory WordlyApiClient.create({
    String? apiUrl,
    Talker? talker,
    String? token,
  }) {
    final dio = Dio();

    dio.interceptors.add(TalkerDioLogger(talker: talker));

    if (token != null) {
      dio.options.headers['x-api-token'] = token;
    }

    if (apiUrl != null) {
      return WordlyApiClient(dio, baseUrl: apiUrl);
    }
    return WordlyApiClient(dio);
  }

  @POST('/api/v1/words')
  Future<WordlyDto> fetchWords(@Body() Wordly wordly);
}
