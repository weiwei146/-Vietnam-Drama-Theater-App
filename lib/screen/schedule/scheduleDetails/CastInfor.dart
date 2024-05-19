import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../interface/Cast.dart';
import 'BottomInfoSheet.dart';
import 'ScheduleDetails.dart';

class CastInFoScreen extends StatefulWidget {
  final Cast cast;
  const CastInFoScreen({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  _CastInFoScreenState createState() => _CastInFoScreenState();
}

class _CastInFoScreenState extends State<CastInFoScreen> {
  late Cast info;
  @override
  void initState() {
    super.initState();
    info = widget.cast;
  }
  @override
  Widget build(BuildContext context) {
    return CastScreenWidget(info: info);
  }
}

class CastScreenWidget extends StatelessWidget {
  final Cast info;
  const CastScreenWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(info.image!),
            fit: BoxFit.cover,
            alignment: Alignment.topLeft,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 100),
          child: Container(
            color: Colors.black.withOpacity(.5),
            child: Stack(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (1 - 0.48),
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl: info.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateIcons(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                CupertinoIcons.back,
                                color: Colors.black,
                              ),
                            ),
                            CreateIcons(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 30, 34, 45),
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return Container(
                                      color: Colors.black26,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            height: 14,
                                          ),
                                          Container(
                                            height: 5,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            children: [
                                              ListTile(
                                                onTap: () {
                                                  //launchURL
                                                },
                                                leading: Icon(
                                                  CupertinoIcons.share,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                title: Text(
                                                  "Mở trong trình duyệt",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Divider(
                                                height: .5,
                                                thickness: .5,
                                                color: Colors.grey.shade800,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.ellipsis,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        child: DelayedDisplay(
                          delay: const Duration(microseconds: 800),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              info.name!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 34,
                                shadows: kElevationToShadow[8],
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                BottomInfoSheet(
                  minSize: .50,
                  backdrops: info.image!,
                  child: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12),
                      child: DelayedDisplay(
                        delay: const Duration(microseconds: 800),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Thông tin cá nhân",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ngày sinh",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        Text(info.birthday!,
                                            style: TextStyle(
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Giới tính",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        info.gender!,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    if (info.titles!.length > 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Các tác phẩm",
                              style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Table(
                              children: info.titles!.map((item) {
                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        item,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
