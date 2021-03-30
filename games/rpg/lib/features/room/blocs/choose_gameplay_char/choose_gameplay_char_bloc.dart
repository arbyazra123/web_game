import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/shared.dart';
part 'choose_gameplay_char_event.dart';
part 'choose_gameplay_char_state.dart';

class ChooseGameplayCharBloc
    extends Bloc<ChooseGameplayCharEvent, ChooseGameplayCharState> {
  ChooseGameplayCharBloc() : super(ChooseGameplayCharInitial());

  @override
  Stream<ChooseGameplayCharState> mapEventToState(
    ChooseGameplayCharEvent event,
  ) async* {
    if (event is GetCharacters) {
      yield ChooseGameplayCharLoading();
      try {
        var result = await FirebaseFirestore.instance
            .collection(gameplayCollection)
            .doc(event.gameplayId)
            .get();
        yield ChooseGameplayCharLoaded(result);
      } catch (e) {
        yield ChooseGameplayCharError();
      }
    }
  }
}
