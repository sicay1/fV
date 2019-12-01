import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<VideoScreen> {
  VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isLoop = true;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-884a9.appspot.com/o/AFTER.mp4?alt=media&token=e4d0842d-4a73-4012-854d-8e11f73f67f4',
    )
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
        _isLoop = _controller.value.isLooping;
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Stack(
        children: <Widget>[
          videoSection(),
          videoControls(),

          backToHomeScreen(context),
        ],
      ),
    );
  }

  Center videoSection() {
    return Center(
      child: _controller.value.initialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(
              child: JumpingText('Loading...', style: TextStyle(fontSize: 30)),
            ),
    );
  }

  Align videoControls() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        height: 40,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying)
                    _controller.pause();
                  else {
                    if (_controller.value.position ==
                        _controller.value.duration)
                      _controller.seekTo(Duration.zero);
                    _controller.play();
                  }
                });
              },
              icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 30,
            ),
            SizedBox(width: 8),
            IconButton(
              onPressed: () {
                setState(() {
                  _isLoop = !_isLoop;
                  _controller..setLooping(_isLoop);
                });
                log('loop ${_controller.value.isLooping}');
              },
              icon: Icon(_controller.value.isLooping
                  ? Icons.loop
                  : Icons.local_movies),
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }

  SafeArea backToHomeScreen(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 30)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
