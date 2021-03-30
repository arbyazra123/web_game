part of 'init_user_bloc.dart';

@immutable
abstract class InitUserEvent {}
class InitUser extends InitUserEvent {
  final BuildContext context;

  InitUser(this.context);
}
