part of 'language_bloc.dart';

class LanguageState extends Equatable {
  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}
class LanguageLoading extends LanguageState {}
class LanguageLoaded extends LanguageState {}
class LanguageError extends LanguageState {}
