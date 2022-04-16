part of 'choose_gameplay_char_bloc.dart';


class ChooseGameplayCharState extends Equatable{
  @override
  List<Object> get props => [];
}

class ChooseGameplayCharInitial extends ChooseGameplayCharState {}
class ChooseGameplayCharLoaded extends ChooseGameplayCharState {
  final DocumentSnapshot<Map<String,dynamic>> result;

  ChooseGameplayCharLoaded(this.result);
  @override
  List<Object> get props => [result];
}
class ChooseGameplayCharError extends ChooseGameplayCharState {}
class ChooseGameplayCharLoading extends ChooseGameplayCharState {}
