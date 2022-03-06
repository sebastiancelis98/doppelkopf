class Player {
  String name;
  int points;

  Player({required this.name, this.points = 0});
  Player.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        points = json['points'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'points': points,
      };
}
