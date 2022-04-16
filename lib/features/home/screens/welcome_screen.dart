import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screen_util.dart';
import 'package:components/components.dart';
import 'package:shared/shared.dart';

class WelcomePage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const WelcomePage({Key key, this.navigatorKey}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
