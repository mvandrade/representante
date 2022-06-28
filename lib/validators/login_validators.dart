import 'dart:async';

class LoginValidators {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError('Informe um e-mal correto!');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 8) {
        sink.add(password);
      } else {
        sink.addError('Senha deve conter no mínimo 8(oito) caracteres!');
      }
    }
  );
  
}