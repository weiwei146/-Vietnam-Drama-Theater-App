import 'package:flutter/material.dart';
import 'dart:ui';
import 'library.dart';
import 'package:namer_app/screen/library/videoYoutube.dart';

class ShowListVideo extends StatelessWidget {
  final List<VideoItem> itemList;

  const ShowListVideo({Key? key, required this.itemList}) : super(key: key);
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
              title: Text('Danh sách video',
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
                  ...itemList.map((item) => buildVideo(item.url, item.title)).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVideo(String url, String title) {
    bool runVideo = false;
    return GestureDetector(
        onTap: () {
        },
        child: Container(
          child: SizedBox(
            width: 400,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 250.0,
                  child: VideoPlayerYoutubeApp(
                    videoUrl: url,
                    runVideo: runVideo,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        ));
  }
}