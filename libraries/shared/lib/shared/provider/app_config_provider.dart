import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppConfigProvider extends InheritedWidget {
  AppConfigProvider({
    this.lang,
    Key key,
    Widget child,
    this.langCode,
    this.isProduction,
    this.navigatorKey
  }) : super(key: key, child: child);
  Map<String, dynamic> lang;
  String langCode;
  bool isProduction;
  GlobalKey<NavigatorState> navigatorKey;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppConfigProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfigProvider>();
  }
}
