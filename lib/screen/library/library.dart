import 'package:flutter/material.dart';
import 'package:namer_app/screen/library/showList.dart';
import 'package:namer_app/screen/library/showListPaper.dart';
import 'package:namer_app/screen/library/showListVideo.dart';
import 'dart:ui';
import 'package:namer_app/screen/library/videoYoutube.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Library {
  final String title;
  final String url;
  final String type;

  Library({required this.url, required this.title, required this.type});

factory Library.fromDocument(DocumentSnapshot doc) {
  return Library(
    title: doc['title'],
    url: doc['url'],
    type: doc['type'],
  );
}
}

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  TextEditingController textController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final List allItems = [];
  final List items = [];
  final List<Library> libraryItems = [];

  @override
  void initState() {
    super.initState();
    fetchNewsItems();
  }

  void fetchNewsItems() async {
    FirebaseFirestore.instance.collection('library').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          libraryItems.add(Library.fromDocument(doc));
        });
      });
    }).catchError((error) {
      print('Error fetching news items: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: libraryItems.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
      : Stack(
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 64.0),
                SearchBar(
                  controller: searchController,
                  leading: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.search),
                  ),
                  hintText: 'Tìm kiếm ảnh/video/tài liệu...',
                ),
                SizedBox(height: 25.0),
                Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(width: 10.0),
                            Text(
                              "Hình ảnh",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        SizedBox(
                          height: 200.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              ...libraryItems.where((item) => item.type == "image").map((item) => Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: buildImage(item.url, item.title),
                              )).toList(),
                              SizedBox(width: 10.0),
                              IconButton(
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ShowList(itemList: libraryItems)),
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
                              SizedBox(width: 15.0),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 10.0),
                            Text(
                              "Video",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(
                          height: 210.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              ...libraryItems.where((item) => item.type == "video").map((item) => Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: buildVideo(item.url, item.title),
                              )).toList(),
                              SizedBox(width: 10.0),
                              IconButton(
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ShowListVideo(itemList: libraryItems)),
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
                              SizedBox(width: 15.0),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 10.0),
                            Text(
                              "Tài liệu",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        SizedBox(
                          height: 200.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              ...libraryItems.where((item) => item.type == "paper").map((item) => Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: buildPdf(item.url, item.title),
                              )).toList(),
                              SizedBox(width: 15.0),
                              IconButton(
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ShowListPaper(itemList: libraryItems)),
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
                              SizedBox(width: 15.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                )],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildImage(String imageUrl, String title) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialogImage(imageUrl);
            },
          );
        },
        child: Container(
          child: SizedBox(
            width: 190.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 120.0,
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
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
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
              ],
            ),
          ),
        ));
  }

  Widget buildPdf(String imageUrl, String title) {
    return GestureDetector(
        onTap: () {
          print("Tai lieu duoc bam vao");
        },
        child: Container(
          child: SizedBox(
            width: 190.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 120.0,
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
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
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
              ],
            ),
          ),
        ));
  }

  Widget buildVideo(String url, String title) {
    bool runVideo = false;
    return GestureDetector(
        onTap: () {
        },
        child: Container(
          child: SizedBox(
            width: 190.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 120.0,
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
              ],
            ),
          ),
        ));
  }

  Widget dialogImage(String imageUrl) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Image.network(
            imageUrl,
            width: 500,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

// Widget buildBackground(BuildContext context) {
//   return
// }
}
