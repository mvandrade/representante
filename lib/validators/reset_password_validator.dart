import 'dart:async';

class ForgotValidators {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError('Informe um e-mal correto!');
      }
    }
  );
}
