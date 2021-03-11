
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DefaultBadge extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool isCircle;
  final double radius;
  const DefaultBadge({Key key, this.height=50, this.width, this.color, this.child, this.padding, this.isCircle=false, this.radius}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding?? EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color??AppColors.primaryColor,
        shape: isCircle?BoxShape.circle:BoxShape.rectangle,
        borderRadius:isCircle?null: BorderRadius.circular(radius?? 8)
      ),
      child: child,
    );
  }
}