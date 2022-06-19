import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recorrente/validators/reset_password_validator.dart';

enum ForgotState { IDLE, LOADING, SUCCESS, FAIL }

class ForgotBloc extends BlocBase with ForgotValidators {
  final _emailController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<ForgotState>();

  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<ForgotState> get outState => _stateController.stream;

    Stream<bool> get outSubmitValid => CombineLatestStream.combine2(outEmail, outEmail, (a, b,) => true);

  Function(String) get changeEmail => _emailController.sink.add;

  void submit() {
    final email = _emailController.value.trim();

    _stateController.add(ForgotState.LOADING);

    FirebaseAuth.instance.sendPasswordResetEmail(email: email)
    .then((_) => _stateController.add(ForgotState.SUCCESS))
    .catchError((e) {
      _stateController.add(ForgotState.FAIL);
    });
  }

  @override
  void dispose() {
    _emailController.close();
   _stateController.close();
  }

}
