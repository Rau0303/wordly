import 'package:wordly/repositories/wordly/wordly.dart';

abstract interface class WordlyRepositoryI{
  Future<List<String>> fetchWords(Wordly wordly);
}