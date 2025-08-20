import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Client {

  Client({
    required this.platform,
    required this.osVersion,
    required this.device,
  });


  

  final String platform;
  final String osVersion;
  final String device;

  

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);


  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
