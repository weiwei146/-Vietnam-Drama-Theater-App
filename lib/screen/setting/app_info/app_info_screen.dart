import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin ứng dụng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên ứng dụng:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Nhà hát kịch Việt Nam'),

            SizedBox(height: 16),

            Text(
              'Phiên bản:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('1.0.0'),

            SizedBox(height: 16),

            Text(
              'Mô tả:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Ứng dụng đa nền tảng quảng bá, giới thiệu những hoạt động của Nhà hát kịch Việt Nam. Ứng dụng này sẽ bao gồm các chức năng chính như xem lịch diễn, đặt vé, tìm hiểu thông tin về các vở kịch và nghệ sĩ, cũng như các tin tức và sự kiện liên quan',
            ),

            SizedBox(height: 16),

            Text(
              'Tác giả:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Nhóm 6 Thiết kế giao diện người dùng'),

            SizedBox(height: 16),

            Text(
              'Liên hệ:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('group6@vnu.edu.vn'),

            // Thêm thông tin khác nếu cần
          ],
        ),
      ),
    );
  }
}
