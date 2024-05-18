import 'package:flutter/material.dart';
import 'dart:ui';
import 'library.dart';

class ShowListPaper extends StatelessWidget {
  final List<PDFLibrary> itemList;

  const ShowListPaper({Key? key, required this.itemList}) : super(key: key);
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
              title: Text('Danh sách tài liệu',
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
                  ...itemList.map((item) => buildPdf(context, item.url, item.title)).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPdf(BuildContext context, String imageUrl, String title) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShowFile()),
          );
        },
        child: Container(
          child: SizedBox(
            width: 400.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 200.0,
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
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ));
  }
}

class ShowFile extends StatelessWidget {

  const ShowFile({Key? key}) : super(key: key);
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
              title: Text('Tài liệu về nghệ sĩ',
                style: TextStyle(
                    color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight + 10.0, left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  buildImage("https://file.hstatic.net/200000370191/article/nsut_quoc_khanh_57b51d2582bb4dd383e789f3fe97bdd5.jpg", "NSƯT QUỐC KHÁNH"),
                  Text(
                    "Năm 2006, nghệ sĩ Quốc Khánh nhận Giải Cánh diều vàng cho 'Nam diễn viên chính xuất sắc nhất' với vai Gù trong phim Áo lụa Hà Đông.Năm 2012, ông được phong tặng danh hiệu Nghệ sĩ Ưu tú.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  buildImage("https://file.hstatic.net/200000370191/article/img_0763_d78afb92e84646e5952a22c2b8d0f346.jpg", "NGHỆ SĨ VIỆT HOA"),
                  Text(
                    "Việt Hoa tên đầy đủ là Vũ Việt Hoa, là một nữ diễn viên trẻ của Nhà hát Kịch Việt Nam. Cô đã tốt nghiệp lớp Diễn viên kịch, điện ảnh tại trường Đại học Sân khấu Điện ảnh Hà Nội. Mới đây, Việt Hoa bất ngờ được khán giả truyền hình chú ý khi vào vai Đào trong phim 'Cô gái nhà người ta', vai Thiên Nga trong phim 'Hương vị tình thân',...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  buildImage("https://file.hstatic.net/200000370191/article/dinh_chien_web_16053176f2304997a99738458976b49b.jpg", "NSƯT ĐÌNH CHIẾN"),
                  Text(
                    "Năm 16 tuổi, Đình Chiến tốt nghiệp ngành diễn viên nhưng do ngoại hình có phần còi cọc nên chỉ nhận được những vai quần chúng. Tới năm 1974, anh về đoàn Trường Sơn, sư đoàn 559 và bắt đầu được giao những vai diễn chính.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  buildImage("https://file.hstatic.net/200000370191/article/do_ky_web_de49050e0ebc40a09d2c5f63ca4366b9.jpg", "NSƯT ĐỖ KỶ"),
                  Text(
                    "NSƯT Đỗ Kỷ tên khai sinh là Phạm Đỗ Kỷ, sinh năm 1961 tại Hà Nội, là một đạo diễn và diễn viên sân khấu người Việt Nam. Đỗ Kỷ sinh năm 1961 tại Hà Nội. Ông tốt nghiệp Lớp đào tạo Diễn viên Khóa I Nhà hát Kịch Việt Nam",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
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
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}