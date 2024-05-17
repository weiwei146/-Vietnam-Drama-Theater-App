import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/repository/authentication_repository/authentication_repository.dart';
import 'package:namer_app/screen/navigation/navigation.dart';
import 'package:namer_app/utlis/theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: GetMaterialApp(
        title: 'Vietnamese Opera Theater',
        theme: TheaterAppTheme.lightTheme,
        darkTheme: TheaterAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        defaultTransition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 1000),
        home: Navigation(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

//MyAppState xác định dữ liệu mà ứng dụng cần để hoạt động
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Button Click Example'),
//         ),
//         body: Center(
//           child: MyButton(),
//         ),
//       ),
//     );
//   }
// }
//
// //MyAppState xác định dữ liệu mà ứng dụng cần để hoạt động
// class MyAppState extends ChangeNotifier {
//   var current = WordPair.random();
// }
//
//
// void setData() async {
//   final db = FirebaseFirestore.instance;
//
//   final schedule = <String, dynamic> {
//     "title": "Romeo và Juliet",
//     "released_on": DateTime(2024, 6, 20, 10, 0).millisecondsSinceEpoch.toString().substring(0, 10),
//     "place": 'Nhà hát Kịch Hà Nội',
//     'poster': 'https://file.hstatic.net/200000370191/article/backrop_2.7mx4mban_cuoib_1e394bbbe3d946c3a2a302ab5267e84d.jpg',
//     'genres': 'Kịch đương đại',
//     'backdrop': 'https://file.hstatic.net/200000370191/file/img_0933_cff4a48548af4bdc9dec1b93e17d8ce5_grande.jpg',
//     "director": 'NSUT. Anh Tú',
//     "length": '140',
//     'overview': '“Romeo và Juliet” là câu chuyện diễn ra trong thành Verona của Italy, với hai dòng họ Montaghiu và Capulet vốn có mối thù hận lâu đời. Bi kịch bắt đầu từ khi con trai của dòng họ Montaghiu là Romeo trà trộn và dự tiệc hóa trang của nhà Capulet, chàng đã gặp nàng Juliet và hai người yêu nhau ngay từ cái nhìn đầu tiên.Câu chuyện Romeo và Juliet không chỉ ngợi ca tình yêu lãng mạn và trong sáng, mà nó còn gửi gắm thông điệp nhân văn. Tình yêu trong sáng, chân thành và đẹp đẽ có thể làm tan chảy những hận thù, định kiến.',
//     "cast": {
//       'one':'NSND. Anh Tú',
//       'two':'NSUT. Xuân Bắc',
//       'three':'Thu Phương'
//     }
//   };
//
//   db.collection("schedules")
//     .doc(generateRandomID(10))
//     .set(schedule)
//     .onError((e, _) => print("Error writing document: $e"));
//
//   print("INSERTED");
//   print("INSERTED");
//   print("INSERTED");
//   print("INSERTED");
//   print("INSERTED");
//   print("INSERTED");
//   print("INSERTED");
// }
//
// class MyButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         // Handle button click here
//         setData();
//       },
//       child: Text('Click Me!'),
//     );
//   }
// }
//
// String generateRandomID(int length) {
//   const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
//   Random rand = Random();
//   return List.generate(length, (index) => charset[rand.nextInt(charset.length)]).join();
// }
