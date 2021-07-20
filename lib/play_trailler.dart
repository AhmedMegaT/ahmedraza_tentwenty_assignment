import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayTrailler extends StatefulWidget {
  String? movieTraillerUrl;
   PlayTrailler({Key? key,this.movieTraillerUrl}) : super(key: key);

  @override
  _PlayTraillerState createState() => _PlayTraillerState();
}

class _PlayTraillerState extends State<PlayTrailler> {

  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4');
    await Future.wait([_videoPlayerController1.initialize()]);
    _videoPlayerController1.addListener(checkVideo);
    _createChewieController();
    setState(() {});
  }
  void checkVideo(){

    if(_videoPlayerController1.value.position == _videoPlayerController1.value.duration) {
     Navigator.pop(context);
    }

  }
  void _createChewieController() {

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: false,
    );
  }
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _chewieController != null &&
            _chewieController!
                .videoPlayerController.value.isInitialized
            ? Chewie(
          controller: _chewieController!,
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading'),
          ],
        ),
      ),
    );
  }
}
