// import 'package:mongo_dart_query/mongo_dart_query.dart';
// import 'package:namer_app/screen/database/mongodb.dart';

class ScheduleFields {
  static final List<String> values = [
    /// Add all fields
    id, backdrop, classification, director, genres,
    imdb_rating,title,poster,released_on,length,slug,overview,cast,isFavorite
  ];
  static const String id = 'id';
  static const String backdrop = 'backdrop';
  static const String classification = 'classification';
  static const String  director = 'director';
  static const String genres = 'genres' ;
  static const String imdb_rating = 'imdb_rating';
  static const String title = 'title';
  static const String poster = 'poster';
  static const released_on = 'released_on';
  static const String length ='length';
  static const String slug = 'slug';
  static const String overview = 'overview';
  static const String cast = 'cast';
  static const String isFavorite = 'isFavorite';
  static const String place = 'place';

}



/// The package [Freezed] was downloaded and could be used to ensure the format
/// of the model is not altered.
///
/// In this case use flutter run build_runner --watch --conflicting-outputs

class Schedule  {
  Schedule({
    this.id,
    this.backdrop,
    this.classification,
    this.director,
    this.cast,
    required this.genres,
    this.imdb_rating,
    required this.title,
    this.poster,
    required this.released_on,
    this.length,
    this.slug,
    this.overview,
    this.isFavorite = 1,
    this.place,
  }) ;

  final String? id;
  final String? backdrop;
  final String? classification;
  final dynamic  director;
  final dynamic genres;
  final double? imdb_rating;
  final String? title;
  final String? poster;
  final DateTime? released_on;
  final String? length;
  final String? slug;
  final String? overview;
  final dynamic cast;
  final int isFavorite;
  final String? place;


  factory Schedule.fromJson(Map<String, dynamic> json) {
    final String? id = json['id'] ;
    final String? backdrop = json['backdrop'];
    final String? classification = json['classification'];
    final dynamic director = json['director'] ;
    final dynamic genres = json['genres'];
    final double? imdbRating = json['imdb_rating'];
    final String? title = json['title'];
    final String? poster = json['poster'];
    final DateTime? releasedOn = json['released_on'];
    final  String? length = json['length'];
    final String? slug = json['slug'];
    final String? overview= json['overview'];
    final dynamic cast = json['cast'];
    final int  isFavorite = json['isFavorite'] ?? 1;
    final String place = json['place'];


    return Schedule(
      id: id,
      backdrop: backdrop,
      classification: classification,
      director: director,
      genres: genres,
      imdb_rating: imdbRating,
      title: title,
      poster: poster,
      released_on: releasedOn,
      length: length,
      slug: slug,
      overview: overview,
      cast: cast.toString(),
      isFavorite: isFavorite,
      place: place,
    );
  }
  Schedule copy({
    final String? id,
    final String? backdrop,
    final String? classification,
    final dynamic  director,
    final List<dynamic>? genres,
    final double? imdb_rating,
    final String? title,
    final String? poster,
    final DateTime? released_on,
    final String? length,
    final String? slug,
    final String? overview,
    final List<dynamic>? cast,
    final int? isFavorite,
    final String? place,
  }) =>
      Schedule(
        id: id ?? this.id,
        backdrop: backdrop ?? this.backdrop,
        classification: classification ?? this.classification,
        director: director ?? this.director,
        genres: genres ?? this.genres,
        imdb_rating: imdb_rating ?? this.imdb_rating,
        title: title ?? this.title,
        poster: poster ?? this.poster,
        released_on: released_on ?? this.released_on,
        length: length ?? this.length,
        slug: slug ?? this.slug,
        overview: overview ?? this.overview,
        cast: cast ?? this.cast,
        isFavorite: isFavorite ?? this.isFavorite,
        place: place ?? this.place,
      );

  Map<String, Object?> toJson() => {
    ScheduleFields.id: id,
    ScheduleFields.title: title,
    ScheduleFields.backdrop: backdrop,
    ScheduleFields.classification: classification,
    ScheduleFields.director: director.toString(),
    ScheduleFields.genres: genres.toString(),
    ScheduleFields.imdb_rating: imdb_rating,
    ScheduleFields.poster: poster,
    ScheduleFields.released_on: released_on,
    ScheduleFields.length: length,
    ScheduleFields.slug: slug,
    ScheduleFields.overview: overview,
    ScheduleFields.cast: cast.toString(),
    ScheduleFields.isFavorite: isFavorite,
    ScheduleFields.place: place,
  };

  @override
  String toString() =>
      'id: $id , backdrop: $backdrop , classification:$classification} , director:$director ,genres:$genres ,isFavorite: $isFavorite';

  // static Future<List<Map<String, dynamic>>> getListOfSchedules() async {
  //   print('Start');
  //   var currentTime = DateTime.now();
  //   var collection = MongoDatabase.db?.collection('schedule');
  //   var query = await collection?.find();
  //
  //   List<Map<String, dynamic>> scheduleList = [];
  //   await query!.forEach((document) {
  //     scheduleList.add(document);
  //     print('hi');
  //   });
  //   return scheduleList;
  // }
}