import 'package:get_it/get_it.dart';
import 'package:rpg/features/room/blocs/choose_gameplay_char/choose_gameplay_char_bloc.dart';
import 'package:rpg/rpg.dart';
import 'package:web_game/routes/main_router.dart';

final mainGi = GetIt.instance;

Future<bool> rpgSetup(String gameId) async {
  mainGi.registerLazySingleton<MainRouter>(() => MainRouter());
  return true;
}
