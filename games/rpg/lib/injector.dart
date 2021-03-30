import 'package:get_it/get_it.dart';
import 'package:rpg/features/room/blocs/choose_gameplay_char/choose_gameplay_char_bloc.dart';
import 'package:rpg/rpg.dart';

final rpg = GetIt.instance;

Future<bool> rpgSetup(String gameId) async {
  rpg.registerLazySingleton<GameRepository>(() => GameRepository(gameId));

  rpg.registerFactory<InitUserBloc>(
      () => InitUserBloc(repository: rpg<GameRepository>()));
  rpg.registerFactory<GameRoomBloc>(
      () => GameRoomBloc(repository: rpg<GameRepository>()));
  rpg.registerFactory<ChooseGameplayCharBloc>(() => ChooseGameplayCharBloc());
  return true;
}
