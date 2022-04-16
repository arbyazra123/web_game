part of 'game_room_bloc.dart';

@immutable
class GameRoomState extends Equatable {
  @override
  List<Object> get props => [];
}

class GameRoomInitial extends GameRoomState {}

class GameRoomError extends GameRoomState {}

class GameRoomLoading extends GameRoomState {}

class GameRoomLoaded extends GameRoomState {
  final String roomId;
  final DocumentSnapshot<Map<String, dynamic>> game;
  final DocumentSnapshot<Map<String, dynamic>> gameRoom;
  GameRoomLoaded({
    this.roomId,
    this.game,
    this.gameRoom,
  });
  @override
  List<Object> get props => [roomId, game, gameRoom];
}
