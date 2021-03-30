import 'package:flutter/material.dart';
import 'package:viewport/viewport.dart';
import 'package:shared/shared.dart';

class H1Atm extends StatelessWidget {
  final String text;
  final int maxLine;
  final TextOverflow overflow;
  final TextStyle style;
  final TextAlign align;

  const H1Atm(
    this.text, {
    Key key,
    this.maxLine,
    this.overflow,
    this.style,
    this.align,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var fs = ViewPort.of(context).aspectRatio * 80;
    var _currentStyle =
        Theme.of(context).textTheme.subtitle1.copyWith(fontSize: fs).apply(color: AppColors.textColor);
    return Text(
      Utils.removeAllHtmlTags(text),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
      style: style?.copyWith(fontSize: fs) ??
          _currentStyle,
    );
  }
}
