class CastFields {
  static final List<String> values = [
    /// Add all fields
    id, name, birthday, gender, overview, image, titles
  ];
  static const String id = 'id';
  static const String name = 'name';
  static const String birthday = 'birthday';
  static const String gender = 'gender';
  static const String overview = 'overview';
  static const String image = 'image';
  static const String titles = 'titles';
}



/// The package [Freezed] was downloaded and could be used to ensure the format
/// of the model is not altered.
///
/// In this case use flutter run build_runner --watch --conflicting-outputs

class Cast  {
  Cast({
    this.id,
    this.name,
    this.birthday,
    this.gender,
    this.overview,
    this.image,
    this.titles
  }) ;

  final String? id;
  final String? name;
  final String? birthday;
  final String? gender;
  final String? overview;
  final String? image;
  final List<String>? titles;

  factory Cast.fromJson(Map<String, dynamic> json) {
    final String? id = json['id'];
    final String? name = json['name'];
    final String? birthday = json['birthday'];
    final String? gender = json['gender'];
    final String? overview = json['overview'];
    final String? image = json['image'];
    final List<String>? titles = json['titles'];

    return Cast(
      id: id,
      name: name,
      birthday: birthday,
      gender: gender,
      overview: overview,
      image: image,
      titles: titles,
    );
  }
  Cast copy({
    final String? id,
    final String? name,
    final String? birthday,
    final String? gender,
    final String? overview,
    final String? image,
    final List<String>? titles,
  }) =>
      Cast(
        id: id ?? this.id,
        name: name ?? this.name,
        birthday: birthday ?? this.birthday,
        gender: gender ?? this.gender,
        overview: overview ?? this.overview,
        image: image ?? this.image,
        titles: titles ?? this.titles,
      );

  Map<String, Object?> toJson() => {
    CastFields.id: id,
  };

}