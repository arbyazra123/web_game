part of 'language_bloc.dart';

class LanguageEvent extends Equatable {
  @override
  List<Object> get props => [];

}

class OnChangeLanguage extends LanguageEvent{
  final BuildContext context;
  final bool onlyEN;
  final String langCode;
  OnChangeLanguage( {this.langCode,this.context, this.onlyEN});
}
