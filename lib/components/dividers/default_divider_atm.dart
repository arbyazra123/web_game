import 'package:flutter/material.dart';

class DefaultDividerAtm extends StatelessWidget {
  final double verticalPadding;
  final double thickness;
  final Color color;
  const DefaultDividerAtm({Key key, this.verticalPadding=0, this.thickness=0.8, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Divider(
        height: 0,
        color:color?? Colors.grey[100],
        thickness: thickness,
      ),
    );
  }
}
