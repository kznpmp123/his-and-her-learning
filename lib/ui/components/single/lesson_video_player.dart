import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:kzn/data/models/lesson.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class LessonVideoPlayer extends StatefulWidget {
  @override
  _LessonVideoPlayerState createState() => _LessonVideoPlayerState();
}

class _LessonVideoPlayerState extends State<LessonVideoPlayer> {
  BetterPlayerController _betterPlayerController;

   VideoPlayerController _controller;
   Future<void> _initializeVideoPlayerFuture;

  ChewieController chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          autoPlay: true,
          looping: true,
          fullScreenByDefault: false,
        )
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _betterPlayerController.dispose();

    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }


  Widget _newVideoPlayer(){
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          chewieController = ChewieController(
            videoPlayerController: _controller,
            autoPlay: true,
            looping: true,
          );
          return Chewie(
            controller: chewieController,
          );
          /*
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: VideoPlayer(_controller),
          );

           */
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _videoPlayerFuture(),
    );
  }

  Widget _videoPlayerFuture(){
    return FutureBuilder(
        future: Provider
            .of<CourseProvider>(context, listen: true)
            .lesson,
        builder: (BuildContext context, AsyncSnapshot<Lesson> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null){
              return Container(child: Center(child: Text('no lesson')),);
            }
            else{
              print("video url is ${snapshot.data.videoUrl}");
              BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
                  BetterPlayerDataSourceType.network,
                  snapshot.data.videoUrl
              );
              _betterPlayerController.setupDataSource(betterPlayerDataSource);
              // return  _videoPlayer();

              // snapshot.data.videoUrl
              // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'

              _controller = VideoPlayerController.network(
                snapshot.data.videoUrl,
              );

              // Initialize the controller and store the Future for later use.
              _initializeVideoPlayerFuture = _controller.initialize();
              // Use the controller to loop the video.
              //_controller.setLooping(true);
              //_controller.play();
              return _newVideoPlayer();



              /*
              final videoPlayerController = VideoPlayerController.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

              // await videoPlayerController.initialize();



              //return _newVideoPlayer();
              // return _chewPlayer(chewieController);

               */
            }
          }
          else if (snapshot.hasError) {
            //_refreshController.refreshCompleted();
            return Container(child: Center(
                child: Text('error ${snapshot.error.toString()}')),);
          }
          else {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('loading lesson...')),);
          }
        }
    );
  }

  Widget _videoPlayer(){
    return Container(
      //aspectRatio: 16 / 9,
      //height: MediaQuery.of(context).size.height,
      child: BetterPlayer(
        controller: _betterPlayerController,
      ),
    );
  }
}
