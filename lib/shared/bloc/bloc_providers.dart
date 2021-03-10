import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_game/features/features.dart';
import 'package:web_game/features/global/blocs/language_bloc/language_bloc.dart';
import 'package:web_game/shared/injector.dart';

class BlocProviders {
  getProviders() {
    return [
      BlocProvider(
        create: (context) => gi<AuthBloc>(),
      ),
      BlocProvider(
        create: (context) => gi<LanguageBloc>(),
      )
    ];
  }
}
