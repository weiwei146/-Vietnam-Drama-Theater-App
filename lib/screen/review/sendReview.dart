import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}



class _ReviewScreenState extends State<ReviewScreen> {
  int _rating = 0; // Số sao người dùng đánh giá, mặc định là 0
  TextEditingController _reviewController = TextEditingController(); // Controller cho ô nhập đánh giá

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gửi đánh giá'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey, // Màu nền mặc định của ảnh đại diện
                  // Thay đổi ảnh đại diện ở đây (ví dụ: NetworkImage, AssetImage)
                  backgroundImage: NetworkImage('https://scontent.fhan19-1.fna.fbcdn.net/v/t1.6435-9/52501595_793648261012338_4544737335232692224_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF-xVs8akkbIjXvhrN67feaXK3Nx5HRGx5crc3HkdEbHpEKYJyH-QQ744omkhiHBvnou6EPjvEwwKnyi5z73hU1&_nc_ohc=pmGzD-mhpFYQ7kNvgFO21B-&_nc_ht=scontent.fhan19-1.fna&oh=00_AYBMedI5kdlnH9GE0J0GjZKQIfV_iiJdNysB0QznquAXHg&oe=666816DC'),
                  radius: 30.0,
                ),
                SizedBox(width: 16.0),
                Text(
                  'Lê Minh Đạt',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 40.0,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1; // Cập nhật số sao người dùng chọn
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Nhập đánh giá của bạn...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    // Xử lý khi người dùng nhấn nút "Đăng"
                    // Ví dụ: Gửi đánh giá lên server
                  },
                  child: Text(
                    'Đăng',
                    style: TextStyle(
                      fontSize: 18.0, // Đặt kích thước chữ của nút "Đăng"
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green, // Màu nền của nút "Đăng"
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Đặt khoảng cách giữa các biên của nút
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Xử lý khi người dùng nhấn nút "Hủy"
                    // Navigator.pop(context); // Đóng trang đánh giá
                  },
                  child: Text(
                    'Hủy',
                    style: TextStyle(
                      fontSize: 18.0, // Đặt kích thước chữ của nút "Hủy"
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red, // Màu nền của nút "Hủy"
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Đặt khoảng cách giữa các biên của nút
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose(); // Giải phóng bộ nhớ khi không cần thiết
    super.dispose();
  }
}
