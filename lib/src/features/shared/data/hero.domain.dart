class HeroDomain {
  int id;
  String name;
  String power;
  String description;

  HeroDomain({required this.id, required this.name, required this.power, required this.description});

  factory HeroDomain.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'id': int id,
        'name': String name,
        'power': String power,
        'description': String description,
      } => HeroDomain(id: id, name: name, power: power, description: description),
      _ => throw const FormatException("Failed Error Dashboard")
    };
  }
}