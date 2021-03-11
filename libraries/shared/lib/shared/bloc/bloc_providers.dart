import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import 'package:core/core.dart';

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
