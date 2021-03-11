import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  Map<String, dynamic> lang;
  String langCode;

  LanguageBloc() : super(LanguageInitial()); //Number FormzStatus
  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is OnChangeLanguage) {
      yield LanguageLoading();
      try {
        print("Language taken " + event.langCode);
        var res = await FirebaseFirestore.instance
            .collection(languageCollection)
            .doc('en')
            .get();
        // var res = await FirebaseFirestore.instance
        //     .collection(languageCollection)
        //     .doc("${event.langCode}")
        //     .get();
        print(res.data());
        AppConfigProvider.of(event.context).lang =
            jsonDecode(res.data()['value']);
        yield LanguageLoaded();
      } catch (e) {
        print(e);
        yield LanguageError();
      }
    }
  }
}
