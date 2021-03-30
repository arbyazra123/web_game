import 'package:core/core.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserProvider extends InheritedWidget {
  UserProvider({
    this.user,
    Key key,
    Widget child,
  }) : super(key: key, child: child);
  User user;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UserProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }
}
