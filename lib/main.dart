import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/screen/navigation/navigation.dart';
import 'package:namer_app/utlis/theme.dart';
import 'package:provider/provider.dart';

void main() {
  //yêu cầu Flutter chạy ứng dụng được xác định trong MyApp.
  runApp(MyApp());
}

//Lớp MyApp mở rộng StatelessWidget. Widget là thành phần giúp bạn xây dựng mọi ứng dụng Flutter.
//Như bạn có thể thấy, ngay cả bản thân ứng dụng cũng là một widget.
//Mã trong MyApp thiết lập toàn bộ ứng dụng.
//Nó tạo ra trạng thái toàn ứng dụng (sẽ nói thêm về điều này sau), đặt tên cho ứng dụng, xác định chủ đề trực quan
//đặt tiện ích "trang chủ"—điểm bắt đầu của ứng dụng của bạn.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

//để tiện ích luôn được cập nhật.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: GetMaterialApp(
        title: 'Vietnamese Opera Theater',
        theme: TheaterAppTheme.lightTheme,
        darkTheme: TheaterAppTheme.darkTheme,
        themeMode: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        home: Navigation(),
      ),
    );
  }
}

//MyAppState xác định dữ liệu mà ứng dụng cần để hoạt động
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}
