import 'package:get_it/get_it.dart';
import 'package:web_game/features/auth/data/repositores/auth_repository.dart';
import 'package:web_game/features/features.dart';
import 'package:web_game/features/global/blocs/language_bloc/language_bloc.dart';

final gi = GetIt.instance;

Future<void> setup() async {
  gi.registerLazySingleton<HomeRepository>(() => HomeRepository());
  gi.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());

  gi.registerFactory<GamesBloc>(
      () => GamesBloc(repository: gi<HomeRepository>()));
  gi.registerFactory<LanguageBloc>(
      () => LanguageBloc());
  gi.registerFactory<AuthBloc>(
      () => AuthBloc(authenticationRepository: gi<AuthenticationRepository>()));


}
