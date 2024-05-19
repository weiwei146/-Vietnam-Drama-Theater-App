
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

DateFormat inputFormat = DateFormat("hh:mm a, dd/MM/yyyy");

class ScheduleFields {
  static final List<String> values = [
    /// Add all fields
    id, backdrop, director, genres,
    title,poster,released_on,length,overview,cast,place, webURL
  ];
  static const String id = 'id';
  static const String backdrop = 'backdrop';
  static const String  director = 'director';
  static const String genres = 'genres' ;
  static const String title = 'title';
  static const String poster = 'poster';
  static const String released_on = 'released_on';
  static const String length ='length';
  static const String overview = 'overview';
  static const String cast = 'cast';
  static const String place = 'place';
  static const String webURL = 'webURL';
}



/// The package [Freezed] was downloaded and could be used to ensure the format
/// of the model is not altered.
///
/// In this case use flutter run build_runner --watch --conflicting-outputs

class Schedule  {
  Schedule({
    this.id,
    this.backdrop,
    this.director,
    this.cast,
    required this.genres,
    required this.title,
    this.poster,
    required this.released_on,
    this.length,
    this.overview,
    this.place,
    this.webURL,
  }) ;

  final String? id;
  final String? backdrop;
  final dynamic  director;
  final dynamic genres;
  final String? title;
  final String? poster;
  final DateTime? released_on;
  final String? length;
  final String? overview;
  final dynamic cast;
  final String? place;
  final String? webURL;

  factory Schedule.fromJson(Map<String, dynamic> json) {
    final String? id = json['id'] ;
    final String? backdrop = json['backdrop'];
    final dynamic director = json['director'] ;
    final dynamic genres = json['genres'];
    final String? title = json['title'];
    final String? poster = json['poster'];
    final DateTime? releasedOn = json['released_on'];
    final String? length = json['length'];
    final String? overview= json['overview'];
    final dynamic cast = json['cast'];
    final String place = json['place'];
    final String webURL = json['webURL'];


    return Schedule(
      id: id,
      backdrop: backdrop,
      director: director,
      genres: genres,
      title: title,
      poster: poster,
      released_on: releasedOn,
      length: length,
      overview: overview,
      cast: cast.toString(),
      place: place,
      webURL: webURL,
    );
  }
  Schedule copy({
    final String? id,
    final String? backdrop,
    final dynamic  director,
    final List<dynamic>? genres,
    final String? title,
    final String? poster,
    final DateTime? released_on,
    final String? length,
    final String? overview,
    final List<String>? cast,
    final String? place,
    final String? webURL,
  }) =>
      Schedule(
        id: id ?? this.id,
        backdrop: backdrop ?? this.backdrop,
        director: director ?? this.director,
        genres: genres ?? this.genres,
        title: title ?? this.title,
        poster: poster ?? this.poster,
        released_on: released_on ?? this.released_on,
        length: length ?? this.length,
        overview: overview ?? this.overview,
        cast: cast ?? this.cast,
        place: place ?? this.place,
        webURL: webURL ?? this.webURL,
      );

  Map<String, Object?> toJson() => {
    ScheduleFields.id: id,
    ScheduleFields.title: title,
    ScheduleFields.backdrop: backdrop,
    ScheduleFields.director: director.toString(),
    ScheduleFields.genres: genres.toString(),
    ScheduleFields.poster: poster,
    ScheduleFields.released_on: released_on,
    ScheduleFields.length: length,
    ScheduleFields.overview: overview,
    ScheduleFields.cast: cast,
    ScheduleFields.place: place,
    ScheduleFields.webURL: webURL,
  };

  factory Schedule.fromDocument(DocumentSnapshot doc) {
    return Schedule(
        id: doc.id,
        backdrop: doc['backdrop'],
        director: doc['director'],
        genres: doc['genres'],
        title: doc['title'],
        poster: doc['poster'],
        released_on: inputFormat.parse(doc['released_on']),
        length: doc['length'],
        overview: doc['overview'],
        cast: doc['cast'],
        place: doc['place'],
        webURL: doc['webURL'] ?? ''
    );
  }

}