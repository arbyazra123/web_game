part of 'choose_gameplay_char_bloc.dart';


class ChooseGameplayCharEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class GetCharacters extends ChooseGameplayCharEvent{
  final String gameplayId;

  GetCharacters(this.gameplayId);
}