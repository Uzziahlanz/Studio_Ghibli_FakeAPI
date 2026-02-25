class Person {
  final String name;
  final String gender;
  final String age;

  Person({required this.name, required this.gender, required this.age});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json["name"] ?? "",
      gender: json["gender"] ?? "",
      age: json["age"] ?? "",
    );
  }
}
