import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viewport/viewport.dart';
import 'package:web_game/shared/shared.dart';


class DefaultTextFieldAtm extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String errorText;
  final String labelText;
  final FocusNode focusNode;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Widget prefix;
  final bool isObscure;
  final VoidCallback onTap;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final bool enabled;
  final int maxLines;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLength;
  final double horizontalPadding;
  final bool hasOutlineBorder;
  final double outlineBorderRadius;
  final TextDirection textDirection;
  final TextStyle style;
  final TextStyle hintStyle;
  final bool hasBorder;
  final List<TextInputFormatter> textInputFormatters;
  const DefaultTextFieldAtm({
    Key key,
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
    this.hasOutlineBorder = false,
    this.outlineBorderRadius = 6,
    this.prefix,
    this.textDirection,
    this.style,
    this.textInputFormatters,
    this.hintStyle,
    this.maxLength,
    this.hasBorder = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var fs = ViewPort.of(context).aspectRatio*18;
    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300],

      ),
    );
    final focusedOutlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(outlineBorderRadius),
    );
    final underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
    );
    final focusedUnderlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 0.5,
      ),

    );
    return TextFormField(
      enabled: enabled,
      controller: controller,
      onTap: onTap,
      readOnly: onTap != null ? true : readOnly,
      obscureText: isObscure,
      maxLines: maxLines,
      maxLength: maxLength,
      initialValue: initialValue,
      inputFormatters: textInputFormatters,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      textDirection: textDirection,
      textInputAction: textInputAction,
      style: style??TextStyle(color: Colors.white,fontSize: fs),
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: prefixIcon,
        contentPadding: horizontalPadding != null
            ? EdgeInsets.symmetric(horizontal: horizontalPadding)
            : null,
        hintStyle: hintStyle??TextStyle(color: Colors.grey[100],fontSize: fs),
        hintText: hintText,
        labelText: labelText,
        isDense: true,
        suffixIcon: suffixIcon,
        enabledBorder: hasBorder
            ? hasOutlineBorder
                ? outlineInputBorder
                : underlineInputBorder
            : InputBorder.none,
        focusedBorder: hasBorder
            ? hasOutlineBorder
                ? focusedOutlineInputBorder
                : focusedUnderlineInputBorder
            : InputBorder.none,
        border: hasBorder
            ? hasOutlineBorder
                ? outlineInputBorder
                : underlineInputBorder
            : InputBorder.none,
      ),
    );
  }
}
