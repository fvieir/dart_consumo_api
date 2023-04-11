import 'dart:convert';

import 'package:consumo_api_alunos/models/aluno_model.dart';
import 'package:http/http.dart' as http;

class AlunoRepository {
  Future<List<AlunoModel>> getAlunos() async {
    var response = await http.get(Uri.parse('http://localhost:4157/alunos'));
    var json = jsonDecode(response.body);

    return json.map<AlunoModel>((aluno) => AlunoModel.fromMap(aluno)).toList();
  }

  Future<AlunoModel> getId(String id) async {
    var response =
        await http.get(Uri.parse('http://localhost:4157/alunos/$id'));

    return AlunoModel.fromJson(response.body);
  }
}
