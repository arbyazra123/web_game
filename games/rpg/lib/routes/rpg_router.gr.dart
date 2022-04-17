// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'rpg_router.dart';

class _$RpgRouter extends RootStackRouter {
  _$RpgRouter([GlobalKey<NavigatorState> navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    RPGMainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RPGMainPage());
    }
  };

  @override
  List<RouteConfig> get routes =>
      [RouteConfig(RPGMainRoute.name, path: '/rpg')];
}

/// generated route for
/// [RPGMainPage]
class RPGMainRoute extends PageRouteInfo<void> {
  const RPGMainRoute() : super(RPGMainRoute.name, path: '/rpg');

  static const String name = 'RPGMainRoute';
}
