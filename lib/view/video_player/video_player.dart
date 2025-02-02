import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class PalyWidget extends StatefulWidget {
  const PalyWidget({super.key});

  @override
  State<PalyWidget> createState() => _PalyWidgetState();
}

class _PalyWidgetState extends State<PalyWidget> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool isVideoIntalized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
  
        
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true);

    videoPlayerController.initialize().then((value) {
      setState(() {
        isVideoIntalized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isVideoIntalized) {
      return AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: Chewie(controller: chewieController));
    }else{
      return CircularProgressIndicator();
    }

  }
}
