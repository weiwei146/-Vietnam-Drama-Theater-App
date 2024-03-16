import 'package:flutter/material.dart';


class Showtimes extends StatefulWidget {
  const Showtimes({super.key});

  @override
  State<Showtimes> createState() => _ShowtimesState();
}

class _ShowtimesState extends State<Showtimes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Trang lịch chiếu"),
    );
  }
}