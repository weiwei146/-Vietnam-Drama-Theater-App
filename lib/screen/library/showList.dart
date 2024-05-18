import 'package:flutter/material.dart';
import 'dart:ui';
import 'library.dart';

class ShowList extends StatelessWidget {
  final List<Library> itemList;

  const ShowList({Key? key, required this.itemList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://i.pinimg.com/564x/6b/66/51/6b6651cb9ca25ae29beea9502381f349.jpg', // Replace with your image URL
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
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text('Danh sách ảnh',
                style: TextStyle(
                    color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: true, // This adds a back button
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight + 10.0, left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  ...itemList.where((item) => item.type == "image").map((item) => buildImage(item.url, item.title)).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String url, String title) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 5.0), // Margin to add spacing
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 1),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}