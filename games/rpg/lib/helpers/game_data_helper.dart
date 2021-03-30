import 'package:flutter/material.dart';
import 'package:rpg/data/models/rpg_game.dart';
import 'package:shared/shared/provider/provider.dart';
import 'package:shared/shared/shared.dart';

enum PASSIVE_ATTR { hp_adder, damage_reducer, power_multiplier }

class GameDataHelper {
  static List<String> getStartingSkills(BuildContext context, String target) {
    switch (target) {
      case "str":
        return [
          "f80fb6d498c9",
          "7448e90d759e",
        ];
        break;
      case "int":
        return [
          "7d416e0c8ea9",
          "7448e90d759e",
        ];
        break;
      case "dex":
        return [
          "54088ff1b804",
          "7448e90d759e",
        ];
        break;
      default:
        return [
          "54088ff1b804",
          "7448e90d759e",
        ];
        break;
    }
  }

  static Class getClassById(BuildContext context, String target) {
    var data = (AppConfigProvider.of(context).gameData as RpgGame).classes;
    return data.firstWhere(
      (element) => element.id == target,
      orElse: () => null,
    );
  }

  static StatElement stat(BuildContext context, String target) {
    var data = (AppConfigProvider.of(context).gameData as RpgGame).stats;
    return data.firstWhere((element) => element.name == target,
        orElse: () => null);
  }

  static Color statColor(BuildContext context, String target) {
    var data = (AppConfigProvider.of(context).gameData as RpgGame).stats;
    return HexColor.fromHex(
        data.where((element) => element.name == target).first.color);
  }

  static Color mainColor(BuildContext context, String target) {
    var data = (AppConfigProvider.of(context).gameData as RpgGame).mainColors;
    return HexColor.fromHex(data
        .where((element) => element.name.toLowerCase() == target.toLowerCase())
        .first
        .color);
  }

  static String attrSlug(BuildContext context, PASSIVE_ATTR target) {
    if (target == null) return "";
    switch (target) {
      case PASSIVE_ATTR.hp_adder:
        return "HP";
        break;
      default:
        return "";
    }
  }
}
