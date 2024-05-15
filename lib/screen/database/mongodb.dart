import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:realm/realm.dart';
import 'database.dart';

class MongoDatabase {
  static Db? db;

  static Future<void> connect() async {
    try {
      db = await Db.create(MONGO_URL);
      await db!.open();
      inspect(db);
      print("Database connected!");
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> close() async {
    try {
      await db!.close();
    } catch (e) {
      log(e.toString());
    }
  }

}
