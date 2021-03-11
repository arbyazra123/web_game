import 'package:get_it/get_it.dart';
import 'package:core/core.dart';
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
