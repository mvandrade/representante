import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recorrente/responsive.dart';
import 'package:recorrente/widgets/header.dart';
import 'package:recorrente/widgets/side_menu.dart';
import 'package:recorrente/widgets/title_page.dart';
import 'package:brasil_fields/brasil_fields.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({Key? key}) : super(key: key);

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameFocus = FocusNode();
  final _nationalRegisterFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _cellPhoneFocus = FocusNode();
  final _contactNameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenuWidget(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenuWidget(),
              ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey.shade50,
                child: Column(
                  children: [
                    const Header(),
                    const TitlePage(
                      title: 'Cadastro de Representante',
                    ),
                    Flexible(
                      child: FittedBox(
                        child: Form(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Dados do Representante',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 215,
                                          child: TextFormField(
                                            textInputAction: TextInputAction.next,
                                            focusNode: _nationalRegisterFocus,
                                            onFieldSubmitted: (_) {
                                              FocusScope.of(context).requestFocus(_nameFocus);
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CnpjInputFormatter()
                                            ],
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'CNPJ'),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 600,
                                          child: TextFormField(
                                            textInputAction: TextInputAction.next,
                                            focusNode: _nameFocus,
                                            onFieldSubmitted: (_) {
                                              FocusScope.of(context).requestFocus(_cellPhoneFocus);
                                            },
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Razão Social'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 215,
                                          child: TextFormField(
                                            textInputAction: TextInputAction.next,
                                            focusNode: _cellPhoneFocus,
                                            onFieldSubmitted: (_) {
                                              FocusScope.of(context).requestFocus(_contactNameFocus);
                                            },
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Celular'),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              TelefoneInputFormatter(),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 600,
                                          child: TextFormField(
                                            textInputAction: TextInputAction.next,
                                            focusNode: _contactNameFocus,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Nome do Contato'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Endereço Comercial',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 215,
                                          child: TextFormField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CepInputFormatter()
                                            ],
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'CEP'),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 600,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Logradouro'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 215,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Numero'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 600,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Complemento'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 350,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Bairro'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 350,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Cidade'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 95,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'UF'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 215,
                                          child: TextField(
                                            textInputAction: TextInputAction.next,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Telefone'),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              TelefoneInputFormatter(),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 600,
                                          child: TextField(
                                            textInputAction: TextInputAction.next,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'E-Mail'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(Icons.arrow_back),
                                              label: const Text('Voltar'),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.lightBlue),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 10),
                                              child: ElevatedButton.icon(
                                                onPressed: () {},
                                                label: const Text('Gravar'),
                                                icon: const Icon(Icons.save),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.lightGreen),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
