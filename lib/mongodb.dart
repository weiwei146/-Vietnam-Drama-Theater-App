import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:realm/realm.dart';
import 'database.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(Db);
    var collection = db.collection(COLLECTION);
    print('Database connected!');
  }
}
