import 'package:formz/formz.dart';
import 'package:web_game/shared/shared.dart';

class PhoneNumber extends FormzInput<String, bool> {
  const PhoneNumber.pure() : super.pure('');
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);

  @override
  bool validator(String value) {
    return Validators.isValid(value)?null:true;
  }
}