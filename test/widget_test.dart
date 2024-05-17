import 'package:firebase_database/firebase_database.dart';

void setData() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref('dramas');
  await ref.set({
    "name": "John",
    "age": 18,
    "address": {
      "line1": "100 Mountain View"
    }
  });
}

void main() {
  setData();
}
