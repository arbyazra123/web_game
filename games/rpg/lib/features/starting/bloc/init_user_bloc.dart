import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rpg/rpg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'init_user_event.dart';
part 'init_user_state.dart';

class InitUserBloc extends Bloc<InitUserEvent, InitUserState> {
  InitUserBloc({this.repository}) : super(InitUserInitial());
  final GameRepository repository;
  // StreamSubscription _subscription;
  @override
  Stream<InitUserState> mapEventToState(
    InitUserEvent event,
  ) async* {
    if (event is InitUser) {
      yield InitUserLoading();
      try {
        var isUserHasRoom = await repository.isUserHasRoom(event.context);
        print("User joined room");
          yield InitUserLoaded(isUserHasRoom);
      } catch (e) {
        print(e);
        yield InitUserError();
      }
    }
  }
}
