import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recorrente/widgets/app_name.dart';
import 'package:recorrente/widgets/input_field.dart';
import 'package:recorrente/blocs/reset_password_bloc.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotState();
}

class _ForgotState extends State<ForgotScreen> {
  final _forgotBloc = ForgotBloc();

  @override
  void initState() {
    super.initState();

    _forgotBloc.outState.listen((state) {
      switch (state) {
        case ForgotState.SUCCESS:
          Navigator.of(context).pushNamed('/ForgotSuccessScreen');
          break;
        case ForgotState.FAIL:
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    title: Text('Erro'),
                    content: Text(
                        'E-Mail informado não encontrado em nosa base de dados, informe um e-mail correto!'),
                  ));
          break;
        case ForgotState.LOADING:
        case ForgotState.IDLE:
      }
    });
  }

  @override
  void dispose() {
    _forgotBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFA2BAF6),
          image: DecorationImage(
            image: const AssetImage("assets/images/fundo.jpg"),
            colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.6), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<Object>(
            stream: _forgotBloc.outState,
            builder: (context, snapshot) {
              switch (snapshot.data) {
                case ForgotState.LOADING:
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue[900])),
                  );
                case ForgotState.FAIL:
                case ForgotState.SUCCESS:
                case ForgotState.IDLE:
                default:
                  break;
              }
              return Stack(
                children: [
                  const AppName(),
                  StreamBuilder<ForgotState>(
                      stream: _forgotBloc.outState,
                      builder: (context, snapshot) {
                        return SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.3,
                                left: MediaQuery.of(context).size.width * 0.3,
                                top: MediaQuery.of(context).size.height * 0.3),
                            child: Card(
                              elevation: 10,
                              color: Colors.white,
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
                                      width: 450,
                                      height: 50,
                                      child: AutoSizeText(
                                        'Por favor, informe o e-mail associado a sua conta de acesso no aplicativo.',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue.shade900,
                                        ),
                                        maxLines: 3,
                                      ),
                                    ),
                                    InputField(
                                      icon: Icons.email_outlined,
                                      hint: 'E-Mail',
                                      obscure: false,
                                      stream: _forgotBloc.outEmail,
                                      onChanged: _forgotBloc.changeEmail,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Enviar',
                                          style: TextStyle(
                                              color: Color(0xff4c505b),
                                              fontSize: 27,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        StreamBuilder<Object>(
                                            stream: _forgotBloc.outSubmitValid,
                                            builder: (context, snapshot) {
                                              return CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    Colors.blue.shade900,
                                                child: IconButton(
                                                  onPressed: snapshot.hasData
                                                      ? _forgotBloc.submit
                                                      : null,
                                                  icon: const Icon(
                                                      Icons.arrow_forward),
                                                  color: Colors.white,
                                                  disabledColor:
                                                      Colors.grey.shade600,
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
                                                .pushNamed('/');
                                          },
                                          child: Text(
                                            'Voltar para o login',
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
                        );
                      }),
                ],
              );
            }));
  }
}
