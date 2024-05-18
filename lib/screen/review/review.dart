import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewScreen extends StatefulWidget {
  final String dramaId; // Add this to accept the dramaId

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
            radius: 24.0, // Tăng kích cỡ avatar
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá vở kịch'),
      ),
      body: StreamBuilder(
        stream: _firestore
            .collection('reviews')
            .where('dramaId', isEqualTo: _firestore.collection('schedules').doc(widget.dramaId))
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
    );
  }
}
