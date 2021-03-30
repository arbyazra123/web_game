import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rpg/helpers/game_data_helper.dart';
import 'package:shared/shared.dart';
import 'package:uuid/uuid.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:rpg/data/models/rpg_game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/shared/constans.dart';
part 'character_creation_state.dart';

class CharacterCreationCubit extends Cubit<CharacterCreationState> {
  CharacterCreationCubit(this.gameId) : super(CharacterCreationState());
  final String gameId;

  bool get isValid =>
      state.name.length > 0 && state.job != null && state.startingItem != null;

  onNameChanged(String name) async {
    emit(state.copyWith(
      name: name,
    ));
  }

  onJobChanged(Class job) async {
    emit(state.copyWith(job: job));
  }

  onConsumableItemChanged(ConsumableItem item) async {
    emit(state.copyWith(startingItem: item));
  }

  createCharacter(String gameplayId, BuildContext context) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      print(gameplayId);
      var existingCharactersResult = await FirebaseFirestore.instance
          .collection(gameplayCollection)
          .doc(gameplayId)
          .get();

      if (!existingCharactersResult.exists) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        return;
      }
      var existingCharacters;
      if (existingCharactersResult.data()['data'] != null) {
        if (existingCharactersResult.data()['data']['characters'] != null &&
            existingCharactersResult.data()['data']['characters'].length != 0) {
              existingCharacters = existingCharactersResult.data()['data']['characters'];
        } else {
          existingCharacters = [];
        }
      } else {
        existingCharacters = [];
      }
      print(existingCharactersResult);
      print(existingCharacters);
      var skills =
          GameDataHelper.getStartingSkills(context, state.job.dominantStatType);
      print(skills);
      existingCharacters.add({
        "id": Uuid().v4(),
        "name": state.name,
        "class": state.job.id,
        "health": "100",
        "drop_equipment_rate": "3",
        "drop_skill_rate": "2",
        "drop_item_rate": "1",
        "current_level": "0",
        "current_dungeon_id": null,
        "current_equipments": null,
        "current_dungeon": null,
        "current_dungeon_effect": null,
        "skills": [
          ...skills,
          state.startingItem.id,
        ],
      });

      await FirebaseFirestore.instance
          .collection(gameplayCollection)
          .doc(gameplayId)
          .update(
        {
          "data": {"characters": existingCharacters},
        },
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
