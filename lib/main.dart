import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screen/navigation/navigation.dart';
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Vietnamese opera theater',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: Navigation(),
      ),
    ); 
  }
}

//MyAppState xác định dữ liệu mà ứng dụng cần để hoạt động
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}




