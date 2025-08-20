// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wordly _$WordlyFromJson(Map<String, dynamic> json) => Wordly(
  client: Client.fromJson(json['client'] as Map<String, dynamic>),
  query: json['query'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$WordlyToJson(Wordly instance) => <String, dynamic>{
  'client': instance.client,
  'query': instance.query,
  'type': instance.type,
};
