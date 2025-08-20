import 'package:wordly/app/app.dart';
import 'package:wordly/repositories/wordly/wordly.dart';

class RepositoryContainer {
  RepositoryContainer({required this.wordlyRepository});

  final WordlyRepositoryI wordlyRepository;

  factory RepositoryContainer.prod({required AppConfig config}) =>
      RepositoryContainer(
        wordlyRepository: WordlyRepository(
          apiClient: config.apiClient,
          realm: config.realm,
        ),
      );
}
