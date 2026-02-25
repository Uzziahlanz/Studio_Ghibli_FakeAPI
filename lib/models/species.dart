class Species {
  final String name;
  final String classification;

  Species({required this.name, required this.classification});

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json["name"] ?? "",
      classification: json["classification"] ?? "",
    );
  }
}
