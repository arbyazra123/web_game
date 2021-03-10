import 'package:formz/formz.dart';
import 'package:web_game/shared/shared.dart';

class Email extends FormzInput<String, bool> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);
  
  @override
  bool validator(String value) {
    return Validators.isValidEmail(value)?null:true;
  }
}
