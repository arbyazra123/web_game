part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  const GamesState();
  
  @override
  List<Object> get props => [];
}

class GamesInitial extends GamesState {}
class GamesLoaded extends GamesState {
  final List<DocumentSnapshot> games;

  GamesLoaded(this.games);
  @override
  List<Object> get props => [games];
}
class GamesError extends GamesState {}
class GamesLoading extends GamesState {}
