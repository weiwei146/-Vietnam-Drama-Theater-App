import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class NewsItem {
  final String title;
  final String imageUrl;

  NewsItem({required this.title, required this.imageUrl});
}



class _ReviewScreenState extends State<ReviewScreen> {
  final SearchController controller = SearchController();

  final List<NewsItem> newsItems = [
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),
    NewsItem(
      title: 'LỄ TRAO TẶNG DANH HIỆU NSND, NSƯT LẦN THỨ 10: NGÀY HỘI VINH DANH NHỮNG NGHỆ SĨ TIÊU BIỂU',
      imageUrl: 'https://file.hstatic.net/200000370191/article/web_nsnd_de2b37d896374d5f82fbee0ee386618a_1024x1024.jpg',
    ),




    // Thêm các tin tức khác vào đây...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tin tức sự kiện'),
      ),
      body: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.grey), // Màu viền xung quanh
              //   borderRadius: BorderRadius.circular(8.0), // Bo góc của container
              // ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Giãn cách bên trong ListTile
                leading: Container(
                  padding: EdgeInsets.all(1.0), // Thêm padding cho ảnh
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.grey), // Màu viền xung quanh ảnh
                  //   borderRadius: BorderRadius.circular(4.0), // Bo góc của ảnh
                  // ),
                  child: Image.network(
                    newsItems[index].imageUrl,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  newsItems[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // Xử lý khi người dùng chọn một tin tức
                  // Ví dụ: Navigator.push để chuyển đến trang chi tiết tin tức
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
