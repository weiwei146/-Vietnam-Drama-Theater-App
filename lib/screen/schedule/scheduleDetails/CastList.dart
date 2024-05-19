import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utlis/animation.dart';
import '../../interface/Cast.dart';
import 'CastInfor.dart';

class CastList extends StatefulWidget {
  final List<dynamic> castListString;
  const CastList({
    Key? key,
    required this.castListString,
  }) : super(key: key);

  @override
  _CastListState createState() => _CastListState();
}

class _CastListState extends State<CastList> {

  late List<Cast> castList = [];
  @override
  void initState() {
    super.initState();
    loadCasts();
  }

  void loadCasts() async {
    widget.castListString.forEach((castID) {
      FirebaseFirestore.instance.collection('casts').doc(castID).get().then((doc) {
        setState(() {
          castList.add(Cast.fromDocument(doc));
          print(castList.last.titles![0]);
        });
      }).catchError((error) {
        print('Error fetching news items: $error');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 300, maxHeight: 320),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 10),
          for (var i = 0; i < castList.length; i++)
            if (castList[i].image != "")
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    pushNewScreen(
                      context,
                        CastInFoScreen(
                        cast: castList[i],
                      )
                    );
                  },
                  child: Tooltip(
                    message: "${castList[i].name}",
                    child: Container(
                      width: 130,
                      constraints: const BoxConstraints(minHeight: 290),
                      child: Column(
                        children: [
                          Container(
                              height: 150,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade900,
                                boxShadow: kElevationToShadow[8],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: castList[i].image!,
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 130,
                                ),
                              )),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 130,
                            child: Text(
                              castList[i].name!,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
