import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  const InputField({Key? key, required this.icon,required  this.hint, required this.obscure, required this.stream, required this.onChanged}) : super(key: key);

  final IconData icon;
  final String hint;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: stream,
      initialData: "",
      builder: (context, snapshot) {
        return TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            // fillColor: Colors.grey.shade100,
            // filled: true,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue.shade900,
              ),
            ),
            contentPadding: const EdgeInsets.only(
              left: 5,
              right: 30,
              bottom: 30,
              top: 30,
            ),
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
          style: const TextStyle(color: Colors.black, fontSize: 16),
          obscureText: obscure,
        );
      },
    );
  }
}
