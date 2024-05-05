import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../interface/Schedule.dart';
import '../interface/SizeConfig.dart';
import 'package:intl/intl.dart';


class ScheduleCard extends StatelessWidget {
  final Schedule schedule;
  const ScheduleCard({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.17,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: SizeConfig.smallPadding),
        child: GestureDetector(
          onTap: () {
            // showCupertinoModalBottomSheet(
            //   /// We set the useRootNavigator to true to remove the [CupertinoBottomBar]
            //   useRootNavigator: true,
            //   duration: const Duration(milliseconds: 400),
            //   context: context,
            //   builder: (context) =>
            //       ScheduleDetailPage(context: context, schedule: schedule),
            // );
          },
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the card
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
          ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin:  EdgeInsets.only(
                        right: SizeConfig.smallPadding,
                    ),

                    width: SizeConfig.screenWidth! * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(schedule.poster!),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),

                  //Title Box
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: SizeConfig.screenHeight! * 0.006),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_parseListOfGenresIntoString(schedule.genres)),
                        SizedBox(
                            height: SizeConfig.screenHeight! * 0.05,
                            width: SizeConfig.screenWidth! * 0.45,
                            child: Center(
                              child: Text(schedule.title!, style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                )),
                            ),
                        ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Thời gian: ',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            TextSpan(
                              text: '${DateFormat('HH:MM, dd/MM/yyyy').format(schedule.released_on!)}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Địa điểm: ',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              TextSpan(
                                text: '${schedule.place}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3),
                  Icon(Icons.arrow_forward_ios,color: Colors.grey),
                  const Spacer(flex: 1),
                ]),
            )
        ),
      ),


    );
  }

  /// This Functions takes care of parsing the list of
  /// genres obtained into a string [RegEx] could be used here to
  /// Refer to documentation if needed.

  String _parseListOfGenresIntoString(genres) {
    String result = genres.toString().replaceAll('[','')
        .replaceAll(']', '').replaceAll(',', ' |');
    return result;
  }


}