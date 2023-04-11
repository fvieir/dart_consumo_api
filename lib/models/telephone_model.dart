import 'dart:convert';

class TelephoneModel {
  final int ddd;
  final String number;

  TelephoneModel({
    required this.ddd,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      "ddd": ddd,
      "number": number,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory TelephoneModel.fromMap(Map<String, dynamic> map) {
    return TelephoneModel(
      ddd: map['ddd'] ?? 0,
      number: map['telefone'] ?? '',
    );
  }

  factory TelephoneModel.fromJson(String json) =>
      TelephoneModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'TelephoneModel(ddd: $ddd, number: $number)';
}
