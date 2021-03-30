import 'package:flutter/material.dart';
import 'package:shared/shared/asset_paths.dart';

class RPGLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset(AssetPaths.loading),
        ));
  }
}
