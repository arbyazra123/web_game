import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screen_util.dart';
import 'package:web_game/components/components.dart';
import 'package:web_game/shared/shared.dart';

import '../../features.dart';

class WelcomeScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const WelcomeScreen({Key key, this.navigatorKey}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 3), () async {
    //   Navigator.push(context, LoginScreen().route());
    // });
  }

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        backgroundColor: Colors.black,
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              H4Atm(
                "Hello, Welcome to",
                align: TextAlign.center,
                style: TextStyle(color: Colors.red[800]),
              ),
              H1Atm(
                "Mroalla",
                align: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[800],
                  fontFamily: metalista
                ),
              ),
              SizedBox(
                height: 30,
              ),
              H5Atm(
                "you will be redirected in ASAP",
                style: TextStyle(color: Colors.grey[300]),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(AssetPaths.loading),
              )
            ],
          ),
        ),
      );
    }
  }
}