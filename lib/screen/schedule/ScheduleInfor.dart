import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screen/schedule/searchBar.dart';

import '../interface/Schedule.dart';

class ScheduleInfor extends StatefulWidget {
  @override
  ScheduleState createState() => ScheduleState();
}

class ScheduleState extends State<ScheduleInfor> {
  TextEditingController textController = TextEditingController();
  List<Schedule> allItems = [];

  @override
  void initState() {
    super.initState();
    loadSchedules();
  }



  void loadSchedules() async {
    FirebaseFirestore.instance.collection('schedules').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          allItems.add(Schedule.fromDocument(doc));
        });
      });
    }).catchError((error) {
      print('Error fetching news items: $error');
    });
  }

  Widget loading() {
    if (allItems.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return CustomSearchBar(allItems: allItems, controller: textController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: loading(),
    );
  }
}

class CircleLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  
}