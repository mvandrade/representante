import 'package:http/http.dart' as http;
import 'package:recorrente/models/result_cep.dart';

class ViaCep {
  static Future<ResultCep> fetchCep({String? cep}) async {
    String url = 'https://viacep.com.br/ws/${cep}/json/';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return ResultCep.fromJson(res.body);
    } else {
      throw Exception('Requisição Inv´lida');
    }
  }
}