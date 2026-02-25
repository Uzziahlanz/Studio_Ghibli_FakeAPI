class GhibliLocation {
  final String name;
  final String climate;
  final String terrain;

  GhibliLocation({
    required this.name,
    required this.climate,
    required this.terrain,
  });

  factory GhibliLocation.fromJson(Map<String, dynamic> json) {
    return GhibliLocation(
      name: json["name"] ?? "",
      climate: json["climate"] ?? "",
      terrain: json["terrain"] ?? "",
    );
  }
}
