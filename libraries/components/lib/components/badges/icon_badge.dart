
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'badges.dart';

class IconBadge extends StatelessWidget {
  final Icon icon;

  const IconBadge({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultBadge(
      isCircle: true,
      padding: EdgeInsets.all(4),
      color: AppColors.primary3Color,
      child: icon,
    );
  }
}