import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import '../validators/confirm_password_validators.dart';

enum ConfirmPasswordtState { IDLE, LOADING, SUCCESS, FAIL, EXPIRED }

class ConfirmPasswordBloc extends BlocBase with ConfirmPasswordValidators {
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmController = BehaviorSubject<String>();
  final _oobCodeController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<ConfirmPasswordtState>();

  Stream<String> get outPassword => _passwordController.stream
          .transform(validatePassword)
          .doOnData((String c) {
        if (0 != _passwordConfirmController.value.compareTo(c)) {
          _passwordConfirmController.addError("Password não confere!");
        }
      });

  Stream<String> get outPasswordConfirm => _passwordConfirmController.stream
          .transform(validatePasswordConfirm)
          .doOnData((String c) {
        if (0 != _passwordController.value.compareTo(c)) {
          _passwordConfirmController.addError("Password não confere!");
        }
      });

  Stream<ConfirmPasswordtState> get outState => _stateController.stream;

  Stream<bool> get outSubmitValid => CombineLatestStream.combine2(
      outPassword,
      outPasswordConfirm,
      (
        a,
        b,
      ) =>
          true);

  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changePasswordConfirm => _passwordConfirmController.sink.add;
  Function(String) get setOobCode => _oobCodeController.sink.add;

  void submit() async {
    final oobCode = _oobCodeController.value;
    final password = _passwordController.value.trim();

    _stateController.add(ConfirmPasswordtState.SUCCESS);

    try { await FirebaseAuth.instance.confirmPasswordReset(code: oobCode, newPassword: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
      case 'expired-action-code' :
        _stateController.add(ConfirmPasswordtState.EXPIRED);
        break;
      default:
        _stateController.add(ConfirmPasswordtState.FAIL);
      }
    }
    catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _passwordController.close();
    _passwordConfirmController.close();
    _stateController.close();
  }
}
