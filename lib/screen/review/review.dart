import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

class ReviewScreen extends StatefulWidget {
  final String dramaId;

  const ReviewScreen({required this.dramaId, super.key});

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
            radius: 24.0,
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
                    fontSize: 22.0,
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
                Text(
                  reviewText,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewScreenState extends State<ReviewScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _rating = 0;
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://i.pinimg.com/564x/6b/66/51/6b6651cb9ca25ae29beea9502381f349.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64.0),
                Row(
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        Icons.star,
                        color: index < _rating ? Colors.yellow: Colors.grey.shade400,
                        size: 40.0,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                    );
                  }),
                ),
                SizedBox(height: 24.0),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    controller: _reviewController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Nhập đánh giá của bạn...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        _firestore.collection('reviews').add({
                          'dramaId': widget.dramaId,
                          'userName': 'Lê Minh Đạt',
                          'avatarUrl': 'https://scontent.fhan19-1.fna.fbcdn.net/v/t1.6435-9/52501595_793648261012338_4544737335232692224_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF-xVs8akkbIjXvhrN67feaXK3Nx5HRGx5crc3HkdEbHpEKYJyH-QQ744omkhiHBvnou6EPjvEwwKnyi5z73hU1&_nc_ohc=pmGzD-mhpFYQ7kNvgFO21B-&_nc_ht=scontent.fhan19-1.fna&oh=00_AYBMedI5kdlnH9GE0J0GjZKQIfV_iiJdNysB0QznquAXHg&oe=666816DC',
                          'rating': _rating,
                          'reviewText': _reviewController.text,
                        }).then((value) {
                          setState(() {
                            _rating = 0;
                            _reviewController.clear();
                          });
                        });
                      },
                      child: Text(
                        'Đăng',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 0.7),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),

                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: StreamBuilder(
                      stream: _firestore
                          .collection('reviews')
                          .where('dramaId', isEqualTo: widget.dramaId)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('Không có đánh giá nào.'));
                        }

                        List<ReviewItem> reviews = snapshot.data!.docs.map((doc) {
                          return ReviewItem(
                            userName: doc['userName'],
                            avatarUrl: doc['avatarUrl'],
                            rating: doc['rating'],
                            reviewText: doc['reviewText'],
                          );
                        }).toList();

                        return ListView.builder(
                          itemCount: reviews.length,
                          itemBuilder: (context, index) {
                            return reviews[index];
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
