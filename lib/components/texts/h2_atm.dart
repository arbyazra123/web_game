import 'package:flutter/material.dart';
import 'package:viewport/viewport.dart';
import 'package:web_game/shared/shared.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter_screenutil/screen_util.dart';
class H2Atm extends StatelessWidget {
  final String text;
  final int maxLine;
  final TextOverflow overflow;
  final TextStyle style;
  final TextAlign align;

  const H2Atm(
    this.text, {
    Key key,
    this.maxLine,
    this.overflow,
    this.style,
    this.align,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var fs = ViewPort.of(context).aspectRatio*50;
   return Text(
      Utils.removeAllHtmlTags(text),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
      style: style?.copyWith(fontSize: fs) ??
          TextStyle(fontSize: fs),
    );
  }
}
