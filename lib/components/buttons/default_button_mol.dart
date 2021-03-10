import 'package:flutter/material.dart';
import 'package:web_game/shared/shared.dart';

import '../components.dart';

class DefaultButtonMol extends StatelessWidget {
  final VoidCallback onClick;
  final Widget child;
  final String text;
  final double height;
  final double width;
  final Color color;
  final bool hasBorderSide;
  final bool whiteMode;
  const DefaultButtonMol(
      {Key key,
      this.onClick,
      this.child,
      this.height = 45,
      this.width,
      this.color,
      this.text,
      this.hasBorderSide = false,
      this.whiteMode = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: 0.4,
            color: hasBorderSide
                ? AppColors.bgGrey2
                : color ?? AppColors.appWhite,
          ),
        ),
        color: color != null
            ? color
            : whiteMode
                ? Colors.transparent
                : AppColors.primaryColor,
        onPressed: onClick,
        child: text != null
            ? Center(
                child: H4Atm(
                  text,
                  style: TextStyle(
                    color: whiteMode ? AppColors.primaryColor : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : child,
      ),
    );
  }
}
