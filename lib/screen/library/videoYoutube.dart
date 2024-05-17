import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerYoutubeApp extends StatelessWidget {
  final String videoUrl;
  final bool runVideo; 
  const VideoPlayerYoutubeApp({Key? key, required this.videoUrl, required this.runVideo}) : super(key: key); // Constructor để chấp nhận giá trị của biến videoUrl và runVideo

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VideoYoutubeScreen(videoUrl: videoUrl, runVideo: runVideo)
    );
  }
}


class VideoYoutubeScreen extends StatefulWidget {
  final String videoUrl;
  final bool runVideo; 
  const VideoYoutubeScreen({Key? key, required this.videoUrl, required this.runVideo}) : super(key: key);

  @override
  State<VideoYoutubeScreen> createState() => _VideoYoutubeScreenState();
}

class _VideoYoutubeScreenState extends State<VideoYoutubeScreen> {
  late YoutubePlayerController controller;
  bool _isInteracted = false;

  @override
  void initState() {
    super.initState();
    const url = "https://www.youtube.com/watch?v=ohW3V_t-hmk&t=13s";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: false,
        hideControls: false
      )
    )..addListener(() {
      if(mounted) {
        setState(() {});
      }
    });
  }

  @override
  void deactivate() {
    if (widget.runVideo) { 
      controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (widget.runVideo) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: controller),
        builder: (context, player) => Container(
          child: ListView(
            children: [player],
          ),
        ),
      ),
    );
  }
}