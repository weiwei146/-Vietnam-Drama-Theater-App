import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screen/introduction/videoPlayerController.dart';
import 'package:namer_app/screen/new/new.dart';
import 'package:namer_app/screen/schedule/schedule.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40.0),
            VideoPlayerApp(),
            SizedBox(height: 25.0),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Schedule()), // Thay thế 'LibraryPage()' bằng tên của trang thư viện của bạn
                  );
                },
                child: Container(
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
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
                              image: NetworkImage("https://theme.hstatic.net/200000370191/1001096184/14/img_home_banner_desktop_1.jpg?v=240"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "VỞ DIỄN",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        Text(
                          "Mỗi tuần là mỗi một câu chuyện ấm áp, mỗi tuần là một câu chuyện tình. Nào cùng bước vào khám phá những câu chuyện mới nhé",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 25.0),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewScreen()), // Thay thế 'LibraryPage()' bằng tên của trang thư viện của bạn
                  );
                },
                child: Container(
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
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
                              image: NetworkImage("https://theme.hstatic.net/200000370191/1001096184/14/img_home_banner_desktop_2.jpg?v=240"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "TIN TỨC SỰ KIỆN",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        Text(
                          "Tin tức biểu diễn nghệ thuật, báo chí và các hoạt động của Nhà hát Kịch Việt Nam",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 25.0),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Schedule()), // Thay thế 'LibraryPage()' bằng tên của trang thư viện của bạn
                  );
                },
                child: Container(
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
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
                              image: NetworkImage("https://theme.hstatic.net/200000370191/1001096184/14/img_banner_bottom_desktop_2.jpg?v=240"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "LỊCH DIỄN",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        Text(
                          "Tìm hiểu về lịch diễn các vở kịch",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(height: 25.0),
            ]),
      )
    );
  }
}
