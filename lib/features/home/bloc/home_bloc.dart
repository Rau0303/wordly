import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordly/repositories/wordly/wordly.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required WordlyRepositoryI wordlyRepository
  }) : _wordlyRepository = wordlyRepository,
  super(HomeInitial()) {
   
  }

  final WordlyRepositoryI _wordlyRepository;
}
