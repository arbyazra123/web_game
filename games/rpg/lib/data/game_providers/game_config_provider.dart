import 'package:flutter/material.dart';
import 'package:rpg/data/models/rpg_game.dart';

// ignore: must_be_immutable
class GameConfigProvider extends InheritedWidget {
  GameConfigProvider({
    Key key,
    Widget child,
    this.gameId,
    this.idGameplay,
    this.gameData,
  }) : super(key: key, child: child);
  String gameId;
  RpgGame gameData;
  String idGameplay;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static GameConfigProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GameConfigProvider>();
  }
}
