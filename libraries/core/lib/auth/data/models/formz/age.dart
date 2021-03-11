import 'package:formz/formz.dart';

class Age extends FormzInput<String, bool> {
  const Age.pure() : super.pure('');
  const Age.dirty([String value = '']) : super.dirty(value);
  
  @override
  bool validator(String value) {
    return null;
  }
}