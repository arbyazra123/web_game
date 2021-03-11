

import 'package:formz/formz.dart';
import 'package:shared/shared.dart';

class Password extends FormzInput<String, bool> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  bool validator(String value) {
    return Validators.isValid(value)?null:true;
  }
}