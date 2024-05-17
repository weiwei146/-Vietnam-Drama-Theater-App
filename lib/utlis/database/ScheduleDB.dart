import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import '../../screen/interface/Schedule.dart';

DateFormat inputFormat = DateFormat("hh:mm a, dd/MM/yyyy");

class ScheduleDB {
  static List<Schedule> getAllSchedules() {
    List<Schedule> allSchedules = [];
    final db = FirebaseFirestore.instance;
    db.collection("schedules").get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          List<dynamic> casts = docSnapshot.data()['cast'].values.toList();
          Schedule schedule =
              Schedule(id: docSnapshot.id,
              backdrop: docSnapshot.data()['backdrop'],
              director: docSnapshot.data()['director'],
              genres: docSnapshot.data()['genres'],
              title: docSnapshot.data()['title'],
              poster: docSnapshot.data()['poster'],
              released_on: inputFormat.parse(docSnapshot.data()['released_on']),
              length: docSnapshot.data()['length'],
              overview: docSnapshot.data()['overview'],
              cast: casts,
              place: docSnapshot.data()['place'],
              webURL: docSnapshot.data()['webURL']);
          allSchedules.add(schedule);
        }
        return allSchedules;
      },
      onError: (e) => print("Error completing: $e"),
    );
    return allSchedules;
  }
}