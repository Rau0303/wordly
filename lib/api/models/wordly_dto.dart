import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';
import 'package:wordly/repositories/wordly/realm/wordly_local.dart';

part 'wordly_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WordlyDto extends Equatable {
  const WordlyDto({
    required this.query,
    required this.type,
    required this.results,
    required this.source,
    required this.cached,
    required this.timestamp,
  });

  final String query;
  final String type;
  final List<String> results;
  final String source;
  final bool cached;
  final String timestamp;

  factory WordlyDto.fromJson(Map<String, dynamic> json) =>
      _$WordlyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WordlyDtoToJson(this);

  List<String> toEntity() => results;

  WordlyLocal toLocal() {
    final local = WordlyLocal(Uuid.v4().toString(), query);
    local.words.addAll(results); 
    return local;
  }

  @override
  List<Object?> get props => [query, type, results, source, cached, timestamp];
}
