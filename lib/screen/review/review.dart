import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screen/introduction/videoPlayerController.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final SearchController controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            searchBar(),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Text(
                  "Hình ảnh",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
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
                  buildImage('https://nld.mediacdn.vn/291774122806476800/2022/9/9/z3707852783950752225873a84d1874063c8dc191319fa-16626983552691933008383.jpg'),
                  SizedBox(width: 15.0),
                  buildImage('https://media.vov.vn/sites/default/files/styles/large/public/2022-12/a_2_0.jpg'),
                  SizedBox(width: 15.0),
                  buildImage('https://nld.mediacdn.vn/291774122806476800/2022/9/9/z3707852783950752225873a84d1874063c8dc191319fa-16626983552691933008383.jpg'),
                  SizedBox(width: 15.0),
                  buildImage('https://media.vov.vn/sites/default/files/styles/large/public/2022-12/a_2_0.jpg'),
                  SizedBox(width: 15.0),
                  buildImage('https://nld.mediacdn.vn/291774122806476800/2022/9/9/z3707852783950752225873a84d1874063c8dc191319fa-16626983552691933008383.jpg'),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Text(
                  "Video",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
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
                ],
              ),
            )
          ],
        ));
  }

  Widget buildImage (String imageUrl) {
    return GestureDetector(
      onTap: () {
        print("Ảnh đã được ấn vào");
      },
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Column(
      children: <Widget>[
        SearchAnchor(
            viewBackgroundColor: Color.fromRGBO(85, 85, 85, 1),
            searchController: controller,
            builder: (BuildContext context, SearchController controller) {
              return IconButton(
                color: Colors.white30,
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
          color: Colors.grey[300], // Màu nền của container
        ),
        child: VideoPlayerApp());
  }
}
