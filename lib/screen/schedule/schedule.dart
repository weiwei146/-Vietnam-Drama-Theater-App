import 'package:flutter/material.dart';
import 'package:namer_app/screen/schedule/searchBar.dart';

class Schedule extends StatefulWidget {
  @override
  ScheduleState createState() => ScheduleState();
}

class ScheduleState extends State<Schedule> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomSearchBar(controller: textController),
    );
  }
}
