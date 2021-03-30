part of 'game_room_bloc.dart';

@immutable
abstract class GameRoomEvent {}

class CreateRoom extends GameRoomEvent{
  final BuildContext context;
  final String gameId;
  CreateRoom(this.context, this.gameId);
}

class GameRoomUdpated extends GameRoomEvent{
  final BuildContext context;
  final DocumentSnapshot game;
  final DocumentSnapshot gameRoom;
  final String roomId;
  GameRoomUdpated({this.context, this.roomId, this.game,this.gameRoom});
}

class JoinRoom extends GameRoomEvent{
  final BuildContext context;
  final DocumentSnapshot room;
  final String gameId;

  JoinRoom({this.context, this.room, this.gameId});
}