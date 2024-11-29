class Planet {
  final String position;
  final String name;
  final String subtitle;
  final String image;
  final String velocity;
  final String distance;
  final String description;
  final String length_of_day;
  final String orbital_period;
  final String gravity;
  final String surface_area;

  Planet({
    required this.position,
    required this.name,
    required this.image,
    required this.velocity,
    required this.distance,
    required this.subtitle,
    required this.description,
    required this.length_of_day,
    required this.orbital_period,
    required this.gravity,
    required this.surface_area,
  });

  factory Planet.fromJson(Map m1) {
    return Planet(
        position: m1['position'],
        name: m1['name'],
        subtitle: m1['subtitle'],
        image: m1['image'],
        velocity: m1['velocity'],
        distance: m1['distance'],
        description: m1['description'],
        gravity: m1['gravity'],
        length_of_day: m1['length_of_day'],
        orbital_period: m1['orbital_period'],
        surface_area: m1['surface_area']
    );
  }
}