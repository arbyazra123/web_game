part of 'init_user_bloc.dart';

class InitUserState extends Equatable {
  @override

  List<Object> get props => [];
}

class InitUserInitial extends InitUserState {}

class InitUserLoading extends InitUserState {}

class InitUserLoaded extends InitUserState {
  final DocumentSnapshot room;
  InitUserLoaded(this.room);
}

class InitUserError extends InitUserState {}
