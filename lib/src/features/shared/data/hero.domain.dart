class HeroDomain {
  int id;
  String name;
  String power;
  String description;

  HeroDomain({required this.id, required this.name, required this.power, required this.description});

  factory HeroDomain.fromJson(Map<String, dynamic> json) => HeroDomain(
      id: json['id'], 
      name: json['name'], 
      power: json['power'], 
      description: json['description']
    );
}