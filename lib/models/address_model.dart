import 'dart:convert';

import 'package:consumo_api_alunos/models/city_model.dart';
import 'package:consumo_api_alunos/models/telephone_model.dart';

class AddressModel {
  final String road;
  final int number;
  final String zipCode;
  final CityModel city;
  final TelephoneModel telephone;

  AddressModel({
    required this.road,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.telephone,
  });

  Map<String, dynamic> toMap() {
    return {
      'road': road,
      'number': number,
      'zipCode': zipCode,
      'city': city.toMap(),
      'telephone': telephone.toMap()
    };
  }

  String toJson() => jsonEncode(toMap());

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      road: map['rua'],
      number: map['numero'],
      zipCode: map['cep'],
      city: CityModel.fromMap(
        map['cidade'] ?? <String, dynamic>{},
      ),
      telephone: TelephoneModel.fromMap(
        map['telefone'] ?? <String, dynamic>{},
      ),
    );
  }

  factory AddressModel.fromJson(String json) =>
      AddressModel.fromMap(jsonDecode(json));
}
