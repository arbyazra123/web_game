import 'package:flutter/material.dart';

extension WidgetX on Widget {
  Route route() => MaterialPageRoute(builder: (_) => this);
}
