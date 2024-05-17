import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // Import flutter_html
import 'new.dart'; // Import NewsItem

class NewsDetailScreen extends StatelessWidget {
  final NewsItem newsItem;
  const NewsDetailScreen({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chi tiết tin tức',
          style: TextStyle(
            fontSize: 24, // Cỡ chữ to hơn
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Html(
                  data: newsItem.content, // Hiển thị nội dung HTML
                  style: {
                    "body": Style(
                      fontSize: FontSize(18.0), // Tăng cỡ chữ của nội dung HTML
                    ),
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Bạn có thể thêm thông tin chi tiết khác ở đây, ví dụ: mô tả, ngày phát hành, v.v.
          ],
        ),
      ),
    );
  }
}
