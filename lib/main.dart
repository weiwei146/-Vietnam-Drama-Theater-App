import 'package:english_words/english_words.dart';
import 'package:firebase_core/firebase_core.dart';
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
  // await MongoDatabase.connect();
  //yêu cầu Flutter chạy ứng dụng được xác định trong MyApp.
  runApp(MyApp());
}

//Lớp MyApp mở rộng StatelessWidget. Widget là thành phần giúp bạn xây dựng mọi ứng dụng Flutter.
//Như bạn có thể thấy, ngay cả bản thân ứng dụng cũng là một widget
//Mã trong MyApp thiết lập toàn bộ ứng dụng.
//Nó tạo ra trạng thái toàn ứng dụng (sẽ nói thêm về điều này sau), đặt tên cho ứng dụng, xác định chủ đề trực quan
//đặt tiện ích "trang chủ"—điểm bắt đầu của ứng dụng của bạn.
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
