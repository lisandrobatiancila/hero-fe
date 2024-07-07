class HeroDomain {
  final int id;
  final String name;
  final String power;
  final String description;
  final int hiredCount;

  HeroDomain({required this.id, required this.name, required this.power, required this.description, required this.hiredCount});

  factory HeroDomain.fromJson(Map<String, dynamic> json) => HeroDomain(
      id: json['id'] ?? 0, 
      name: json['name']?? "", 
      power: json['power']?? "", 
      description: json['description']?? "",
      hiredCount: json['hire_count'] ?? "",
    );

  Map<String, dynamic> toJson() {
    return {'id':id , 'name': id, 'power': power, 'description': description, "hire_count": hiredCount};
  }
}
