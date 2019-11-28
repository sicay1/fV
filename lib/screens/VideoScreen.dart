import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isLoop = true;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
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
  Widget build(BuildContext context) => Scaffold(
        // title: 'Video Player',
        appBar: new AppBar(),
        // debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(),
        body: Scaffold(
          body: Center(
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () {
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

                  log(' video pos? ${_controller.value.position}');
                  log(' video dur? ${_controller.value.duration}');
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 30,
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  setState(() {
                    _isLoop = !_isLoop;
                    _controller..setLooping(_isLoop);
                  });
                  log('loop ${_controller.value.isLooping}');
                },
                child: Icon(
                  _controller.value.isLooping ? Icons.loop : Icons.local_movies,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      );
}