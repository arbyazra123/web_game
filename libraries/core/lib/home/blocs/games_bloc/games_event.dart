part of 'games_bloc.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();

  @override
  List<Object> get props => [];
}

class GetGames extends GamesEvent{}
class GamesUpdated extends GamesEvent{
  final List<DocumentSnapshot> games;

  GamesUpdated(this.games);
}