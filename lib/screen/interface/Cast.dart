class Cast {
  final String name;
  final String character;
  final String image;
  final String id;

  Cast({
    required this.name,
    required this.character,
    required this.image,
    required this.id,
  });

  factory Cast.fromJson(json) {
    return Cast(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      image: json['profile_path'] != null
          ? "https://image.tmdb.org/t/p/w500" + json['profile_path']
          : "",
    );
  }
}