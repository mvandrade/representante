import 'package:flutter/material.dart';

class InputFieldObscure extends StatefulWidget {
  const InputFieldObscure(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.showValue,
      required this.stream,
      required this.onChanged})
      : super(key: key);

  final IconData icon;
  final String hint;
  final bool showValue;
  final Stream<String> stream;
  final Function(String) onChanged;

  @override
  State<InputFieldObscure> createState() => _InputFieldObscureState();
}

class _InputFieldObscureState extends State<InputFieldObscure> {

  bool _showValues = false;

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<String>(
      stream: widget.stream,
      initialData: "",
      builder: (context, snapshot) {
        return TextField(
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              color: Colors.blue.shade900,
            ),
            suffix: GestureDetector(
              child: Icon( _showValues ? Icons.visibility : Icons.visibility_off, color: Colors.blue.shade900,),
              onTap: () {
                setState(() {
                  _showValues = !_showValues;
                });
              },
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade900,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
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
          obscureText: _showValues ? false: true,
        );
      },
    );
  }
}
