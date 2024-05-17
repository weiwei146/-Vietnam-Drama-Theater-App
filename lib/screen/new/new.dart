import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../interface/SizeConfig.dart';
import 'NewsCard.dart'; // Import NewsCard

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NewScreen(),
//     );
//   }
// }

class NewsItem {
  final String title;
  final String imageUrl;
  final String content;

  NewsItem({required this.title, required this.imageUrl, required this.content});

  factory NewsItem.fromDocument(DocumentSnapshot doc) {
    return NewsItem(
      title: doc['title'],
      imageUrl: doc['imageUrl'],
      content: doc['content'],
    );
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final List<NewsItem> newsItems = [];

  @override
  void initState() {
    super.initState();
    fetchNewsItems();
  }

  void fetchNewsItems() async {
    FirebaseFirestore.instance.collection('news').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          newsItems.add(NewsItem.fromDocument(doc));
        });
      });
    }).catchError((error) {
      print('Error fetching news items: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tin tức sự kiện',
          style: TextStyle(
            fontSize: 30, // Cỡ chữ to hơn
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: newsItems.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding trái phải
            child: NewsCard(newsItem: newsItems[index]),
          );
        },
      ),
    );
  }
}
