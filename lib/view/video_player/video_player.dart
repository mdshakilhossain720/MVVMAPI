import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayWidget extends StatefulWidget {
  const PlayWidget({super.key});

  @override
  State<PlayWidget> createState() => _PlayWidgetState();
}

class _PlayWidgetState extends State<PlayWidget> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController; // Nullable, only initialized after video loads
  bool isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  Future<void> initializeVideo() async {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    );

    await videoPlayerController.initialize(); // Wait for initialization

    setState(() {
      isVideoInitialized = true;
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
      );
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isVideoInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: Chewie(controller: chewieController!),
            )
          : const CircularProgressIndicator(), // Show loader while video initializes
    );
  }
}
