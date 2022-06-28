
import 'dart:async';

class ConfirmPasswordValidators {

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 8) {
        sink.add(password);
      } else {
        sink.addError('Senha deve conter no mínimo 8(oito) caracteres!');
      }
    }
  );

  final validatePasswordConfirm = StreamTransformer<String, String>.fromHandlers(
    handleData: (passwordConfirm, sink) {
      if (passwordConfirm.length >= 8) {
        sink.add(passwordConfirm);
      } else {
        sink.addError('Senha deve conter no mínimo 8(oito) caracteres!');
      }
    }
  );
}