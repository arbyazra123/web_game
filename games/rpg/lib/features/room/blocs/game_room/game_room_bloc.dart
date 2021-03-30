import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../rpg.dart';

part 'game_room_event.dart';
part 'game_room_state.dart';

class GameRoomBloc extends Bloc<GameRoomEvent, GameRoomState> {
  GameRoomBloc({this.repository}) : super(GameRoomInitial());

  final GameRepository repository;
  StreamSubscription _subscription;

  @override
  Stream<GameRoomState> mapEventToState(
    GameRoomEvent event,
  ) async* {
    if (event is GameRoomUdpated) {
      yield GameRoomLoaded(roomId: event.roomId, game: event.game,gameRoom: event.gameRoom);
    }
    if (event is CreateRoom) {
      yield GameRoomLoading();

      try {
        var createdRoom = await repository.createRoom(event.context);
        if (_subscription != null) {
          _subscription.cancel().then((value) =>
              _subscription = repository.streamGame().listen((games) {
                add(GameRoomUdpated(
                  context: event.context,
                  game: games,
                  roomId: createdRoom.id,
                  gameRoom: createdRoom,
                ));
              }));
        } else {
          _subscription = repository.streamGame().listen((games) {
            add(GameRoomUdpated(
              context: event.context,
              game: games,
              roomId: createdRoom.id,
              gameRoom: createdRoom,
            ));
          });
        }
      } catch (e) {
        print(e);
        yield GameRoomError();
      }
    }

    if (event is JoinRoom) {
      yield GameRoomLoading();
      try {
        if (_subscription != null) {
          _subscription.cancel().then((value) =>
              _subscription = repository.streamGame().listen((games) {
                add(GameRoomUdpated(
                    context: event.context,
                    game: games,
                    roomId: event.room.id));
              }));
        } else {
          _subscription = repository.streamGame().listen((games) {
            add(GameRoomUdpated(
                context: event.context, game: games, roomId: event.room.id));
          });
        }
      } catch (e) {
        print(e);
        yield GameRoomError();
      }
    }
  }
}
