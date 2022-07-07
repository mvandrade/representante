import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recorrente/widgets/app_name.dart';

class ForgotSuccessScreen extends StatelessWidget {
  const ForgotSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFA2BAF6),
            image: DecorationImage(
              image: const AssetImage("assets/images/fundo.jpg"),
              colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.6), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const AppName(),
        Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.35,
              right: MediaQuery.of(context).size.width * 0.3,
              left: MediaQuery.of(context).size.width * 0.3,
              top: MediaQuery.of(context).size.height * 0.35),
          child: Card(
            elevation: 10,
            color: Colors.white,
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
                  const SizedBox(
                    width: 450,
                    height: 50,
                    child: AutoSizeText(
                      'Verifique sua caixa de e-mal.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    width: 450,
                    height: 75,
                    child: AutoSizeText(
                      'Enviamos um e-mail com um link para que você possa redefinir sua senha.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/');
                        },
                        child: Text(
                          'Ir para o login',
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
      ],
    ));
  }
}
