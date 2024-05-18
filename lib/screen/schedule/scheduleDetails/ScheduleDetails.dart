import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:expandable_group/expandable_group_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screen/booking/BookingScreen.dart';
import 'package:namer_app/screen/interface/Schedule.dart';
import 'package:intl/intl.dart';
import 'package:namer_app/utlis/database/SlotDB.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import 'BottomInfoSheet.dart';

class ScheduleDetails extends StatefulWidget {
  final Schedule schedule;
  final BuildContext context;
  const ScheduleDetails({
    Key? key,
    required this.context,
    required this.schedule,
  }) : super(key: key);

  @override
  _ScheduleDetailsState createState() => _ScheduleDetailsState();
}

class _ScheduleDetailsState extends State<ScheduleDetails> {
  late Set<SeatNumber> soldSeat;
  @override
  void initState() {
    super.initState();
    soldSeat = SlotDB.getSlotsByMovieID(widget.schedule.id!);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Your main content goes here
        ScheduleDetailsWidget(
            schedule: widget.schedule
        ),
        // Floating bottom widget
        Positioned(
          left: 32,
          right: 32,
          bottom: 24,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffA12830),// Background color of the container
              borderRadius: BorderRadius.circular(16.0), // Rounded corners for the top side only
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xffA12830)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingScreen(context: context, soldSeats: soldSeat, title: widget.schedule.title!,)),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Đặt vé xem kịch',
                    style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ScheduleDetailsWidget extends StatelessWidget {
  final Schedule schedule;
  const ScheduleDetailsWidget({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(schedule.poster!),
            fit: BoxFit.cover,
            alignment: Alignment.topLeft,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 50),
          child: Container(
            color: Colors.white.withOpacity(.5),
            child: Stack(
              // physics: BouncingScrollPhysics(),
              children: [
                Stack(
                  children: [
                    InkWell(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * (1 - 0.63),
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          imageUrl: schedule.backdrop!, //backdrop
                          fit: BoxFit.cover,
                        ),
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
                                      color: Colors.white,
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
                                                  launchUrl(Uri.parse(schedule.webURL!));
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
                                                color: Colors.black,
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
                    )
                  ],
                ),
                BottomInfoSheet(
                  backdrops: schedule.backdrop!, //backdrop
                  child: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: DelayedDisplay(
                              delay: const Duration(microseconds: 500),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: kElevationToShadow[8],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                      imageUrl: schedule.poster!, width: 120),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DelayedDisplay(
                                    delay: const Duration(microseconds: 700),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: schedule.title,
                                            style:
                                            TextStyle(fontSize: 22, color: Color(0xffA12830)),
                                          ),
                                          TextSpan(
                                            text:
                                            " (${DateFormat('hh:mm a, dd/MM/yyyy').format(schedule.released_on!)})",
                                            style: TextStyle(
                                              color:
                                              Colors.black.withOpacity(.8),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  DelayedDisplay(
                                    delay: const Duration(microseconds: 700),
                                    child: Text(
                                      schedule.genres,
                                      style: TextStyle(
                                          color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (schedule.overview != '') // schedule.overview
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DelayedDisplay(
                                delay: const Duration(microseconds: 800),
                                child: Text("Mô tả",
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 10),
                            DelayedDisplay(
                              delay: const Duration(microseconds: 1000),
                              child: ReadMoreText(
                                schedule.overview!, //overview
                                trimLines: 4,
                                colorClickableText: Color(0xffA12830),
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Xem thêm',
                                trimExpandedText: 'Rút ngắn',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                                moreStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            "Thông tin về vở diễn",
                            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4, // Number of items including the header
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                return ListTile(
                                  title: Text(
                                    "Thời lượng",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    schedule.length! + " phút.",
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  ),
                                );
                              case 1:
                                return ListTile(
                                  title: Text(
                                    "Biên kịch",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    schedule.director,
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  ),
                                );
                              case 2:
                                return ListTile(
                                  title: Text(
                                    "Đạo diễn",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    schedule.director,
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  ),
                                );
                              case 3:
                                return ListTile(
                                  title: Text(
                                    "Thời gian bắt đầu",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    DateFormat('hh:mm a, dd/MM/yyyy').format(schedule.released_on!),
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  ),
                                );
                              default:
                                return Container(); // Return empty container for any other index
                            }
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black, // Set the color of the divider to black
                            thickness: 1, // Adjust thickness as needed
                          ),
                        ),
                      ],
                    ),
                    if (schedule.cast.length > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text("Diễn viên",
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          // CastList(
                          //   castList: castList,
                          // ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }
}

class CreateIcons extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const CreateIcons({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: kElevationToShadow[2],
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 50),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(.5),
            ),
            child: InkWell(onTap: onTap, child: child),
          ),
        ),
      ),
    );
  }
}