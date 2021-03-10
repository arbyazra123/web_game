import 'package:formz/formz.dart';
import 'package:web_game/shared/shared.dart';

class Name extends FormzInput<String, bool> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);
  @override
  bool validator(String value) {
    return Validators.isValid(value) ? null : true;
  }
}
