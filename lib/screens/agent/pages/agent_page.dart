import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recorrente/core/constants/color_constants.dart';
import 'package:recorrente/widgets/header.dart';
import 'package:recorrente/widgets/title_page.dart';
import 'package:brasil_fields/brasil_fields.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({Key? key}) : super(key: key);

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _controller,
        child: Container(
          decoration: BoxDecoration(color: Colors.grey.shade50),
          padding: const EdgeInsets.all(defaultPadding / 8),
          child: Column(
            children: [
              const Header(),
              const TitlePage(
                title: 'Cadastro de Representantes',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: FittedBox(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 30,
                      ),
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
                                child: TextField(
                                  textInputAction: TextInputAction.next,
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
                              const SizedBox(
                                width: 600,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
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
                                child: TextField(
                                  textInputAction: TextInputAction.next,
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
                              const SizedBox(
                                width: 600,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
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
                                child: TextField(
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
                            children: const [
                              SizedBox(
                                width: 215,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Telefone'),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
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
                          Row(
                            children: const [
                              SizedBox(
                                width: 215,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Telefone'),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
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
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
      ),
    );
  }
}
