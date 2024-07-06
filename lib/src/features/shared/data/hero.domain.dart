class HeroDomain {
  final int id;
  final String name;
  final String power;
  final String description;

  HeroDomain({required this.id, required this.name, required this.power, required this.description});

  factory HeroDomain.fromJson(Map<String, dynamic> json) => HeroDomain(
      id: json['id'] ?? 0, 
      name: json['name']?? "", 
      power: json['power']?? "", 
      description: json['description']?? ""
    );

  Map<String, dynamic> toJson() {
    return {'id':id , 'name': id, 'power': power, 'description': description};
  }
}
