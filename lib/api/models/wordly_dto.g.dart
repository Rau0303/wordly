// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordly_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordlyDto _$WordlyDtoFromJson(Map<String, dynamic> json) => WordlyDto(
  query: json['query'] as String,
  type: json['type'] as String,
  results: (json['results'] as List<dynamic>).map((e) => e as String).toList(),
  source: json['source'] as String,
  cached: json['cached'] as bool,
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$WordlyDtoToJson(WordlyDto instance) => <String, dynamic>{
  'query': instance.query,
  'type': instance.type,
  'results': instance.results,
  'source': instance.source,
  'cached': instance.cached,
  'timestamp': instance.timestamp,
};
