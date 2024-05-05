import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:namer_app/screen/library/videoInReview.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final SearchController controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
      Scaffold(
    body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/564x/6b/66/51/6b6651cb9ca25ae29beea9502381f349.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [searchBar(), SizedBox(width: 20.0)],
        ),
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            SizedBox(width: 20.0),
            Text(
              "Hình ảnh",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        SizedBox(
          height: 180.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 20.0),
              buildImage(
                  'https://nld.mediacdn.vn/291774122806476800/2022/9/9/z3707852783950752225873a84d1874063c8dc191319fa-16626983552691933008383.jpg'),
              SizedBox(width: 15.0),
              buildImage(
                  'https://media.vov.vn/sites/default/files/styles/large/public/2022-12/a_2_0.jpg'),
              SizedBox(width: 15.0),
              buildImage(
                  'https://nld.mediacdn.vn/291774122806476800/2022/9/9/z3707852783950752225873a84d1874063c8dc191319fa-16626983552691933008383.jpg'),
              SizedBox(width: 15.0),
              buildImage(
                  'https://media.vov.vn/sites/default/files/styles/large/public/2022-12/a_2_0.jpg'),
              SizedBox(width: 15.0),
              buildImage(
                  'https://nld.mediacdn.vn/291774122806476800/2022/9/9/z3707852783950752225873a84d1874063c8dc191319fa-16626983552691933008383.jpg'),
              SizedBox(width: 15.0),
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  //xem full list ảnh ở đây
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
            SizedBox(width: 20.0),
            Text(
              "Video",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          height: 120.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 20.0),
              buildVideo(),
              SizedBox(width: 15.0),
              buildVideo(),
              SizedBox(width: 15.0),
              buildVideo(),
              SizedBox(width: 15.0),
              buildVideo(),
              SizedBox(width: 15.0),
              buildVideo(),
              SizedBox(width: 15.0),
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  //xem full list ảnh ở đây
                },
                icon: const Icon(Icons.add),
              ),
              SizedBox(width: 15.0),
            ],
          ),
        ),
        SizedBox(height: 50.0),
        Row(
          children: <Widget>[
            SizedBox(width: 20.0),
            Text(
              "Tài liệu",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        SizedBox(
          height: 180.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 20.0),
              buildPdf(
                  'https://play-lh.googleusercontent.com/dl4ZuJhfD5xR9m2H-oZ9UcLZwYmGpmWMurPrvTiN831ZWLia9NbrYurXV-32wtOzPmM5'),
              SizedBox(width: 15.0),
              buildPdf(
                  'https://play-lh.googleusercontent.com/dl4ZuJhfD5xR9m2H-oZ9UcLZwYmGpmWMurPrvTiN831ZWLia9NbrYurXV-32wtOzPmM5'),
              SizedBox(width: 15.0),
              buildPdf(
                  'https://play-lh.googleusercontent.com/dl4ZuJhfD5xR9m2H-oZ9UcLZwYmGpmWMurPrvTiN831ZWLia9NbrYurXV-32wtOzPmM5'),
              SizedBox(width: 15.0),
              buildPdf(
                  'https://play-lh.googleusercontent.com/dl4ZuJhfD5xR9m2H-oZ9UcLZwYmGpmWMurPrvTiN831ZWLia9NbrYurXV-32wtOzPmM5'),
              SizedBox(width: 15.0),
              buildPdf(
                  'https://play-lh.googleusercontent.com/dl4ZuJhfD5xR9m2H-oZ9UcLZwYmGpmWMurPrvTiN831ZWLia9NbrYurXV-32wtOzPmM5'),
              SizedBox(width: 15.0),
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  //xem full list ảnh ở đây
                },
                icon: const Icon(Icons.add),
              ),
              SizedBox(width: 15.0),
            ],
          ),
        ),
      ],
    ))))
    ]);
  }

  Widget buildImage(String imageUrl) {
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
          child: Container(
            width: 170.0,
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
                  "Title of Image",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildPdf(String imageUrl) {
    return GestureDetector(
        onTap: () {
          print("Tai lieu duoc bam vao");
        },
        child: Container(
          child: Container(
            width: 170.0,
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
                  "Title of PDF",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }

  Widget searchBar() {
    return Column(
      children: <Widget>[
        SearchAnchor(
            viewBackgroundColor: Color.fromRGBO(85, 85, 85, 1),
            searchController: controller,
            builder: (BuildContext context, SearchController controller) {
              return IconButton(
                color: Colors.white,
                icon: const Icon(Icons.search),
                onPressed: () {
                  // controller.openView();
                },
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
      ],
    );
  }

  Widget buildVideo() {
    return Container(
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[300],
        ),
        child: VideoPlayerApp());
  }

  Widget dialogImage(String imageUrl) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero, // Đặt contentPadding thành zero
      content: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Image.network(
            imageUrl, // Đường dẫn ảnh
            width: 500,
            height: 300,
            fit: BoxFit.cover, // Chế độ hiển thị của ảnh
          ),
        ),
      ),
    );
  }

  // Widget buildBackground(BuildContext context) {
  //   return 
  // }
}
