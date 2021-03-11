import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

class ManipulateButtonMol extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onClick;
  final bool isPositive;

  const ManipulateButtonMol(
      {Key key,
      this.width = 40,
      this.height = 30,
      this.onClick,
      this.isPositive = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color:
                    !isPositive ? AppColors.bgGrey2 : AppColors.primary2Color,
              )),
          padding: EdgeInsets.zero,
          child: Center(
            child: isPositive
                ? Icon(
                    Icons.add,
                    size: 16,
                    color: AppColors.primaryColor,
                  )
                : Icon(
                    Icons.remove,
                    size: 16,
                    color: AppColors.greyDark,
                  ),
          ),
          color: isPositive ? AppColors.primary2Color : Colors.white,
          onPressed: onClick),
    );
  }
}
