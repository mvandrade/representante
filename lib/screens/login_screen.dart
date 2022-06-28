import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recorrente/blocs/login_bloc.dart';
import 'package:recorrente/widgets/app_name.dart';
import 'package:recorrente/widgets/input_field.dart';
import 'package:recorrente/widgets/input_field_obscure.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushNamed('/HomeScreen');
          break;
        case LoginState.FAIL:
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    title: Text('Erro'),
                    content: Text('E-Mail e/ou Senha inválidos'),
                  ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFA2BAF6),
        image: DecorationImage(
          image: const AssetImage("assets/images/fundo.jpg"),
          colorFilter:
              ColorFilter.mode(Colors.blue.withOpacity(0.6), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<LoginState>(
            stream: _loginBloc.outState,
            initialData: LoginState.LOADING,
            builder: (context, snapshot) {
              switch (snapshot.data) {
                case LoginState.LOADING:
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue[900])),
                  );
                case LoginState.FAIL:
                case LoginState.SUCCESS:
                case LoginState.IDLE:
                default:
                  break;
              }
              return Stack(
                children: [
                  const AppName(),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.3,
                          right: MediaQuery.of(context).size.width * 0.3,
                          left: MediaQuery.of(context).size.width * 0.3,
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: Card(
                        elevation: 10,
                        color: Colors.blue[300],
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withBlue(255),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 400,
                                height: 50,
                                child: AutoSizeText(
                                  'Informe seus dados para efetuar o login.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue.shade900,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              InputField(
                                icon: Icons.email_outlined,
                                hint: 'E-Mail',
                                obscure: false,
                                stream: _loginBloc.outEmail,
                                onChanged: _loginBloc.changeEmail,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputFieldObscure(
                                icon: Icons.lock_outline,
                                hint: 'Senha',
                                showValue: false,
                                stream: _loginBloc.outPassword,
                                onChanged: _loginBloc.changePassword,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Acessar',
                                    style: TextStyle(
                                        color: Color(0xff4c505b),
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  StreamBuilder<Object>(
                                      stream: _loginBloc.outSubmitValid,
                                      builder: (context, snapshot) {
                                        return CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.blue.shade900,
                                          child: IconButton(
                                            onPressed: snapshot.hasData
                                                ? _loginBloc.submit
                                                : null,
                                            icon:
                                                const Icon(Icons.arrow_forward),
                                            color: Colors.white,
                                            disabledColor: Colors.grey.shade600,
                                          ),
                                        );
                                      })
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/ForgotScreen');
                                    },
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    child: Text(
                                      'Esqueceu sua senha?',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        color: Colors.blue.shade900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
