
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/videos/demo.mp4');

    _initializeVideoPlayerFuture = _controller.initialize();
  
    _controller.setLooping(true);

    if(_controller.value.isPlaying == false) {
      setState(() {
        _controller.play();
      });
    }

    _controller.setVolume(0.0);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerApp extends StatelessWidget {
//   const VideoPlayerApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: VideoPlayerScreen(),
//     );
//   }
// }
//
// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});
//
//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = VideoPlayerController.asset('assets/videos/demo.mp4');
//
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     _controller.setLooping(true);
//
//     if(_controller.value.isPlaying == false) {
//       setState(() {
//         _controller.play();
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(() {
//       //       if (_controller.value.isPlaying) {
//       //         _controller.pause();
//       //       } else {
//       //         _controller.play();
//       //       }
//       //     });
//       //   },
//       //   child: Icon(
//       //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//       //   ),
//       // ),
//     );
//   }
// }
//
//
