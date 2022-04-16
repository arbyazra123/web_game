import 'package:auto_route/auto_route.dart';
import 'package:rpg/main_rpg.dart';
import 'package:rpg/routes/rpg_routes.dart';

part 'rpg_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: RpgRoutes.main,
      page: RPGMain,
    ),
  ],
)

class RpgRouter extends _$RpgRouter {}
