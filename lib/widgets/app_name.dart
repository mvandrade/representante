import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, top: 35),
      child: Text(
        'Venda &\n Representação',
        style: TextStyle(
          color: Colors.blue.shade700,
          fontSize: 45,
          fontFamily: 'Anton',
          decoration: TextDecoration.none,
          shadows: [
            Shadow(
                color: Colors.grey.shade900,
                blurRadius: 5,
                offset: const Offset(5, 5)),
          ],
        ),
      ),
    );
  }
}
