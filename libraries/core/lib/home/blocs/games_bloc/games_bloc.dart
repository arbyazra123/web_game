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
    if(event is ResetGames){
      yield GamesInitial();
    }
    if (event is GetGames) {
      yield GamesLoading();
    
      try {
        // await repository.printx();
        if (_subscription != null) {
        _subscription.cancel().then(
            (value) => _subscription = repository.getGames().listen((games) {
                  add(GamesUpdated(games));
                }));
      } else {
        _subscription = repository.getGames().listen((games) {
          add(GamesUpdated(games));
        });
      }
      } catch (e) {
        print(e);
        yield GamesError();
      }
    }
    if (event is GamesUpdated) {
      yield GamesLoaded(event.games);
    }
  }
}
