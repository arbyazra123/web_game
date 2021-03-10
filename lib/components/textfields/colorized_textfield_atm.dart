import 'package:flutter/material.dart';
import 'package:web_game/shared/shared.dart';

class ColorizedTextFieldAtm extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String errorText;
  final String labelText;
  final FocusNode focusNode;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final bool isObscure;
  final VoidCallback onTap;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final bool enabled;
  final int maxLines;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool readOnly;
  final double horizontalPadding;
  final double verticalPadding;
  final bool hasOutlineBorder;
  const ColorizedTextFieldAtm(
      {Key key,
      this.hintText,
      this.controller,
      this.errorText,
      this.suffixIcon,
      this.isObscure = false,
      this.maxLines = 1,
      this.onChanged,
      this.onTap,
      this.keyboardType,
      this.initialValue,
      this.enabled = true,
      this.readOnly = false,
      this.labelText,
      this.horizontalPadding,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.validator,
      this.prefixIcon,
      this.hasOutlineBorder,
      this.verticalPadding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(
        left: Dimens.dp16,
        right: Dimens.dp16,
        top: Dimens.dp16,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        onTap: onTap,
        readOnly: onTap != null ? true : readOnly,
        obscureText: isObscure,
        maxLines: maxLines,
        initialValue: initialValue,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: prefixIcon,
          contentPadding:EdgeInsets.symmetric(
                  vertical: 13
                ),
          hintText: hintText,
          labelText: labelText,
          hintStyle: TextStyle(fontSize: Dimens.dp14),
          // isDense: true,
          suffixIcon: suffixIcon,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
