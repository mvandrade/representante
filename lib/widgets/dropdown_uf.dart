import 'package:flutter/material.dart';

class DropdownUF extends StatefulWidget {
  const DropdownUF({Key? key, required this.onChanged}) : super(key: key,);

  final Function(String) onChanged;

  @override
  State<DropdownUF> createState() => _DropdownUFState();
}

class _DropdownUFState extends State<DropdownUF> {
  List<String> items = [
    'AC',
    'AL',
    'AM',
    'AP',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MG',
    'MS',
    'MT',
    'PA',
    'PB',
    'PE',
    'PI',
    'PR',
    'RJ',
    'RN',
    'RO',
    'RR',
    'RS',
    'SC',
    'SE',
    'SP',
    'TO'
  ];

  String? selecttedItem = 'SP';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selecttedItem,
      items: items.map((item) => DropdownMenuItem<String>(value: item, child: Text(item, style: const TextStyle(fontSize: 24)),)).toList(),
      onChanged: null);
  }
}
