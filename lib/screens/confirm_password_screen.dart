import 'package:flutter/material.dart';
import 'package:recorrente/blocs/confirm_password_bloc.dart';
import 'package:recorrente/widgets/app_name.dart';
import 'package:recorrente/widgets/input_field.dart';
import 'package:recorrente/widgets/input_field_obscure.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({Key? key, required this.oobCode}) : super(key: key);

  final String oobCode;

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  final _confirmPasswordBloc = ConfirmPasswordBloc();


  @override
  void initState() {
    super.initState();

    _confirmPasswordBloc.setOobCode(widget.oobCode);

    _confirmPasswordBloc.outState.listen((state) {
      switch (state) {
        case ConfirmPasswordtState.SUCCESS:
          Navigator.of(context).pushNamed('/LoginScreen');
          break;
        case ConfirmPasswordtState.FAIL:
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    title: Text('Erro'),
                    content: Text(
                        'E-Mail informado não encontrado em nosa base de dados, informe um e-mail correto!'),
                  ));
          break;
          case ConfirmPasswordtState.EXPIRED:
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                      title: Text('Erro'),
                      content: Text(
                          'O seu pedido de alteração de senha expirou, faca a operação novamente.'),
                    ));
            break;
        case ConfirmPasswordtState.LOADING:
        case ConfirmPasswordtState.IDLE:
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    String oobCodeStream = widget.oobCode;

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
      child: StreamBuilder<Object>(
        stream: _confirmPasswordBloc.outState,
        builder: (context, snapshot) {
                        switch (snapshot.data) {
                case ConfirmPasswordtState.LOADING:
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue[900])),
                  );
                case ConfirmPasswordtState.FAIL:
                case ConfirmPasswordtState.SUCCESS:
                case ConfirmPasswordtState.IDLE:
                default:
                  break;
              }

          return Stack(children: [
            const AppName(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3,
                    left: MediaQuery.of(context).size.width * 0.3,
                    top: MediaQuery.of(context).size.height * 0.3),
                child: Card(
                  elevation: 10,
                  color: Colors.blue[300],
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.background.withBlue(255),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Por favor, informe sua nova senha.',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue.shade900,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InputFieldObscure(
                          icon: Icons.lock_outline,
                          hint: 'Senha',
                          showValue: false,
                          stream: _confirmPasswordBloc.outPassword,
                          onChanged: _confirmPasswordBloc.changePassword,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InputFieldObscure(
                          icon: Icons.lock_outline,
                          hint: 'Confirme a Senha',
                          showValue: false,
                          stream: _confirmPasswordBloc.outPasswordConfirm,
                          onChanged: _confirmPasswordBloc.changePasswordConfirm,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                stream: _confirmPasswordBloc.outSubmitValid,
                                builder: (context, snapshot) {
                                  return CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue.shade900,
                                    child: IconButton(
                                      onPressed: snapshot.hasData
                                          ? _confirmPasswordBloc.submit
                                          : null,
                                      icon: const Icon(Icons.arrow_forward),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]);
        }
      ),
    );
  }
}