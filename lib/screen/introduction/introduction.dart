import 'package:flutter/material.dart';
import 'package:namer_app/screen/introduction/videoPlayerController.dart';


class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayerApp(),
    );
  }
}

