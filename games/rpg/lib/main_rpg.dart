import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg/data/game_providers/game_config_provider.dart';
import 'package:rpg/features/room/pages/character_creation_screen.dart';
import 'package:rpg/rpg_loading_screen.dart';
import 'package:shared/shared.dart';
import 'data/models/rpg_game.dart';
import 'features/features.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'features/home/pages/home_screen.dart';
import 'injector.dart';

class RPGMain extends StatelessWidget {
  final String gameId;

  const RPGMain({Key key, this.gameId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GameConfigProvider(
      child: MultiBlocProvider(
        providers: providers,
        child: !rpg.isRegistered<InitUserBloc>()
            ? FutureBuilder<bool>(
                future: rpgSetup(gameId),
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  if (!snapshot.hasData) return RPGLoadingScreen();

                  return RPGApp(
                    gameId: gameId,
                  );
                },
              )
            : RPGApp(
                gameId: gameId,
              ),
      ),
    );
  }
}

class RPGApp extends StatelessWidget {
  const RPGApp({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection(gameCollection)
            .doc(gameId)
            .get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.data.exists) {
            return Center(
              child: H2Atm("No Data"),
            );
          }
          AppConfigProvider.of(context).gameData =
              RpgGame.fromJson(snapshot.data.data());
          AppConfigProvider.of(context).gameId = snapshot.data.id;
          return HomeScreen(
            gameId: gameId,
          );
          // return CharacterCreationScreen(
          //   gameId: gameId,
          //   gameData: snapshot.data,
          // );
        });
  }
}

get providers => [
      BlocProvider(
        create: (context) => rpg<InitUserBloc>(),
      ),
      // BlocProvider(
      //   create: (context) => rpg<ChooseGameplayCharBloc>(),
      // ),
    ];
