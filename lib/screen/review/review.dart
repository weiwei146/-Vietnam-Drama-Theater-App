import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class ReviewItem extends StatelessWidget {
  final String userName;
  final String avatarUrl;
  final int rating;
  final String reviewText;

  ReviewItem({
    required this.userName,
    required this.avatarUrl,
    required this.rating,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0, // Đặt kích thước chữ ở đây (ví dụ: 18.0)
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: List.generate(5, (index) {
                    if (index < rating) {
                      return Icon(Icons.star, color: Colors.yellow);
                    } else {
                      return Icon(Icons.star, color: Colors.grey);
                    }
                  }),
                ),
                SizedBox(height: 8.0),
                Text(reviewText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewList extends StatelessWidget {
  final List<ReviewItem> reviews;

  ReviewList({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return reviews[index];
      },
    );
  }
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<ReviewItem> reviews = [
    ReviewItem(
      userName: 'Người dùng A',
      avatarUrl: 'https://scontent.fhan19-1.fna.fbcdn.net/v/t1.6435-9/52501595_793648261012338_4544737335232692224_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF-xVs8akkbIjXvhrN67feaXK3Nx5HRGx5crc3HkdEbHpEKYJyH-QQ744omkhiHBvnou6EPjvEwwKnyi5z73hU1&_nc_ohc=pmGzD-mhpFYQ7kNvgFO21B-&_nc_ht=scontent.fhan19-1.fna&oh=00_AYBMedI5kdlnH9GE0J0GjZKQIfV_iiJdNysB0QznquAXHg&oe=666816DC',
      rating: 4,
      reviewText: 'Vở kịch rất hay, diễn viên đáng để xem.',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 5,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'https://scontent.fhan19-1.fna.fbcdn.net/v/t1.6435-9/52501595_793648261012338_4544737335232692224_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF-xVs8akkbIjXvhrN67feaXK3Nx5HRGx5crc3HkdEbHpEKYJyH-QQ744omkhiHBvnou6EPjvEwwKnyi5z73hU1&_nc_ohc=pmGzD-mhpFYQ7kNvgFO21B-&_nc_ht=scontent.fhan19-1.fna&oh=00_AYBMedI5kdlnH9GE0J0GjZKQIfV_iiJdNysB0QznquAXHg&oe=666816DC',
      rating: 5,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 5,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 3,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 1,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 2,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 3,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 4,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 4,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 4,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 4,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 5,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 2,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 3,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 4,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 3,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 2,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 1,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 2,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),
    ReviewItem(
      userName: 'Người dùng B',
      avatarUrl: 'URL_ảnh_B',
      rating: 3,
      reviewText: 'Tuyệt vời, không thể tuyệt hơn!',
    ),


    // Thêm các đánh giá khác vào đây
  ];

  @override
  Widget build(BuildContext context) {
    List<ReviewItem> visibleReviews = reviews; // Lấy 10 đánh giá đầu tiên

    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá vở kịch (${visibleReviews.length})'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: visibleReviews.length,
              itemBuilder: (context, index) {
                return ReviewItem(
                  userName: visibleReviews[index].userName,
                  avatarUrl: visibleReviews[index].avatarUrl,
                  rating: visibleReviews[index].rating,
                  reviewText: visibleReviews[index].reviewText,
                );
              },
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     // Xử lý khi người dùng nhấn vào nút "Xem tất cả"
          //     // Hiển thị tất cả các đánh giá
          //
          //     setState(() {
          //       visibleReviews = reviews; // Hiển thị tất cả đánh giá
          //     });
          //     print(visibleReviews.length);
          //   },
          //   child: Text('Xem tất cả (${reviews.length} đánh giá)'),
          // ),
        ],
      ),
    );
  }
}
