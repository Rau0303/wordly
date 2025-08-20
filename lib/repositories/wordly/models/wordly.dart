import 'package:json_annotation/json_annotation.dart';
import 'package:wordly/repositories/wordly/wordly.dart';


part 'wordly.g.dart'; 


@JsonSerializable(fieldRename: FieldRename.snake)
class Wordly {
  Wordly({required this.client, required this.query, required this.type});



  final Client client;
  final String query;
  final String type;


  

  factory Wordly.fromJson(Map<String, dynamic> json) => _$WordlyFromJson(json);


  Map<String, dynamic> toJson() => _$WordlyToJson(this);
}
