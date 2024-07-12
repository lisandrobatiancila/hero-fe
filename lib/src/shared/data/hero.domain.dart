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

class HiredHeroesDomain {
  int heroId;
  String name;
  String power;
  String description;
  int hire_count;

  HiredHeroesDomain({
    required this.heroId, required this.name, 
    required this.power, required this.description, 
    required this.hire_count}
  );

  factory HiredHeroesDomain.fromJson(Map<String, dynamic> json) => 
    HiredHeroesDomain(heroId: json['id'], name: json['name'], power: json['power'], 
    description: json['description'], hire_count: json['hire_count']);
}