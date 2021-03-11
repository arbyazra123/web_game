import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../components.dart';

class CalculatorUnitIcon extends StatelessWidget {
  final String unit;

  const CalculatorUnitIcon({Key key, this.unit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.dp18,
        top: 15,
      ),
      child: H1Atm(
        unit,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
