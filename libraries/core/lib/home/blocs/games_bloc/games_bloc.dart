import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:core/core.dart';
part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc({this.repository}) : super(GamesInitial());
  final HomeRepository repository;
  StreamSubscription _subscription;
  @override
  Stream<GamesState> mapEventToState(
    GamesEvent event,
  ) async* {
    if (event is GetGames) {
      yield GamesLoading();
      _subscription?.cancel();
      _subscription = repository.getGames().listen((games) {
        print(games.length);
        add(GamesUpdated(games));
      });
    }
    if (event is GamesUpdated) {
      yield GamesLoaded(event.games);
    }
  }
}
