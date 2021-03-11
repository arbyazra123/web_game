import 'package:flutter/material.dart';
import 'package:shared/shared.dart';


class GradientIconAtm extends StatelessWidget {
  final Icon icon;

  const GradientIconAtm({Key key, @required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds){
        return AppColors.primaryGradient.createShader(bounds);
      },
      child: Theme(
        data: ThemeData(
          iconTheme: IconThemeData(color: AppColors.appWhite)
        ),
        child: icon),
    );
  }
}