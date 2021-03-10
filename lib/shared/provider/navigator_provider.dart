// import 'package:flutter/material.dart';


// class AppConfigProvider extends InheritedWidget {

//   const AppConfigProvider({
//     this.alice, 
//     Key key,
//     @required this.stacks,
//     this.remoteConfig, 
//     this.current,
//     @required Widget child,
//   })  : assert(stacks != null),
//         assert(child != null),
//         super(key: key, child: child);

//   final Set<ScreenNavigationEvent> stacks;
//   final ScreenNavigationEvent current;
//   final RemoteConfig remoteConfig;
//   final Alice alice;

//   static AppConfigProvider of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AppConfigProvider>();
//   }

//   @override
//   bool updateShouldNotify(AppConfigProvider old) {
//     return stacks != old.stacks;
//   }

// }