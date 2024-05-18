import 'package:flutter/material.dart';
import 'package:namer_app/screen/library/showList.dart';
import 'package:namer_app/screen/library/showListPaper.dart';
import 'package:namer_app/screen/library/showListVideo.dart';
import 'dart:ui';
import 'package:namer_app/screen/library/videoYoutube.dart';
import 'package:namer_app/screen/schedule/searchBar.dart';


class ImageLibrary {
  final String title;
  final String url;

  ImageLibrary({required this.url, required this.title});
//
// factory ImgLibary.fromDocument(DocumentSnapshot doc) {
//   return ImgLibary(
//     title: doc['title'],
//     imageUrl: doc['imageUrl'],
//     content: doc['content'],
//   );
// }
}


List<ImageLibrary> imageList = [
  ImageLibrary(
    url: 'https://file.hstatic.net/200000370191/article/eef809c870b8bee6e7a924_39668d0d684b4f9bbe6040c58c2f4f9f.jpg',
    title: 'NSƯT XUÂN BẮC - GIÁM ĐỐC NHÀ HÁT KỊCH VIỆT NAM GỬI LỜI CHÚC TẾT 2022',
  ),
  ImageLibrary(
    url: 'https://file.hstatic.net/200000370191/article/pano_ctd_123_47eda5a3e73f4381b013e755ff56ceec.jpg',
    title: '"CHÉN THUỐC ĐỘC" - NHÀ HÁT KỊCH VIỆT NAM THAM GIA VỞ DIỄN KỶ NIỆM 100 NĂM SÂN KHẤU KỊCH NÓI VIỆT NAM',
  ),
  ImageLibrary(
    url: 'https://file.hstatic.net/200000370191/article/dang_tin_ng_tot_nha_so_5_1a57f4954ccd4f6bbb985effd6b02a04.jpg',
    title: 'CẢM NHẬN CỦA KHÁN GIẢ KHI XEM "NGƯỜI TỐT NHÀ SỐ 5"',
  ),
  ImageLibrary(
    url: 'https://file.hstatic.net/200000370191/article/dsc00910_5a6df2ac291c406e88566b358b916f34.jpg',
    title: 'NHÀ HÁT KỊCH VIỆT NAM - LIÊN HOAN KỊCH NÓI 2021',
  ),
];

class VideoItem {
  final String title;
  final String url;

  VideoItem({required this.title, required this.url});
}

List<VideoItem> videoItems = [
  VideoItem(
    title: "Đôi mắt - vở diễn của Nhà Hát kịch HN",
    url: "https://www.youtube.com/watch?v=ShCuv1Osr9w",
  ),
  VideoItem(
    title: "TRAILER VỞ KỊCH 'ĐÊM TRẮNG'",
    url: "https://www.youtube.com/watch?v=BpXByY1npVM",
  ),
];

class PDFLibrary {
  final String title;
  final String url;

  PDFLibrary({required this.url, required this.title});
//
// factory ImgLibary.fromDocument(DocumentSnapshot doc) {
//   return ImgLibary(
//     title: doc['title'],
//     imageUrl: doc['imageUrl'],
//     content: doc['content'],
//   );
// }
}

List<PDFLibrary> pdfItems = [
  PDFLibrary(
    title: "Tài liệu về nghệ sĩ",
    url: 'https://play-lh.googleusercontent.com/dl4ZuJhfD5xR9m2H-oZ9UcLZwYmGpmWMurPrvTiN831ZWLia9NbrYurXV-32wtOzPmM5',
  ),
];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: allItems.isEmpty
      //     ? Center(
      //   child: CircularProgressIndicator(),
      // )
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
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity as needed
              child: Container(
                color: Colors.white.withOpacity(0.2), // Adjust opacity as needed
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
                      // Handle leading icon button press
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
                              ...imageList.map((item) => Padding(
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
                                    MaterialPageRoute(builder: (context) => ShowList(itemList: imageList)),
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
                              ...videoItems.map((item) => Padding(
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
                                    MaterialPageRoute(builder: (context) => ShowListVideo(itemList: videoItems)),
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
                              ...pdfItems.map((item) => Padding(
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
                                    MaterialPageRoute(builder: (context) => ShowListPaper(itemList: pdfItems)),
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
