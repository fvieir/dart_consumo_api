import 'dart:convert';

import 'address_model.dart';
import 'course_model.dart';

class AlunoModel {
  final int id;
  final String name;
  final String? age;
  final List<String> courseNames;
  final List<CourseModel> courses;
  final AddressModel address;

  AlunoModel({
    required this.id,
    required this.name,
    this.age,
    required this.courseNames,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      if (age != null) 'age': age,
      'courseNames': courseNames,
      'courses': courses.map((course) => course.toMap()).toList(),
      'address': address.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory AlunoModel.fromMap(Map<String, dynamic> map) {
    return AlunoModel(
      id: map['id'] ?? 0,
      name: map['nome'] ?? '',
      courseNames: List<String>.from(map['nomeCursos'] ?? <String>[]),
      courses: map['cursos']
              ?.map<CourseModel>((courseMap) => CourseModel.fromMap(courseMap))
              .toList() ??
          <CourseModel>[],
      address: AddressModel.fromMap(
        map['address'] ?? <String, dynamic>{},
      ),
    );
  }

  factory AlunoModel.fromJson(String json) =>
      AlunoModel.fromMap(jsonDecode(json));
}
