import 'dart:convert';

class CourseModel {
  final int id;
  final String name;
  final bool isStudent;

  CourseModel({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isStudent': isStudent,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      name: map['nome'],
      isStudent: map['isAluno'],
    );
  }

  factory CourseModel.fromJson(String json) =>
      CourseModel.fromMap(jsonDecode(json));

  @override
  String toString() =>
      'CourseModel(id: $id, name: $name, isStudent: $isStudent)';
}
