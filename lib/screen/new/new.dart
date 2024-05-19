import 'dart:ui'; // Import dart:ui for BackdropFilter

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../interface/SizeConfig.dart';
// Import NewsCard (assuming you have this defined somewhere in your project)
import 'NewsCard.dart';

// Define your NewsItem class
class NewsItem {
  final String title;
  final String imageUrl;
  final String content;

  NewsItem(
      {required this.title, required this.imageUrl, required this.content});

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
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Tin tức sự kiện',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: newsItems.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: newsItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: NewsCard(newsItem: newsItems[index]),
                          );
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
