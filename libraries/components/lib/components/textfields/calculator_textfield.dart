import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

import '../components.dart';


class CalculatorTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String title;
  final String errorText;
  final String inputUnit;
  final TextEditingController controller;
  const CalculatorTextField({
    Key key,
    this.onChanged,
    this.title,
    this.errorText,
    this.controller,
    this.inputUnit = "Rp",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H2Atm(
          title,
          style: TextStylesTheme.appbarBlackText,
        ),
        SizedBox(
          height: Dimens.dp8,
        ),
        DefaultTextFieldAtm(
          controller: controller,
          hasOutlineBorder: true,
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          errorText: errorText,
          textInputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            CurrencyInputFormatter()
          ],
          style: TextStyle(fontWeight: FontWeight.w500),
          prefixIcon: CalculatorUnitIcon(unit: inputUnit,),
        ),
      ],
    );
  }
}
