// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
  platform: json['platform'] as String,
  osVersion: json['os_version'] as String,
  device: json['device'] as String,
);

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
  'platform': instance.platform,
  'os_version': instance.osVersion,
  'device': instance.device,
};
