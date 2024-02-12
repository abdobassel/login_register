import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:project/core/colors_app.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerListItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerListItem({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  _VideoPlayerListItemState createState() => _VideoPlayerListItemState();
}

class _VideoPlayerListItemState extends State<VideoPlayerListItem> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  Future initializeVideo() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: false,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    initializeVideo();
    _videoPlayerController.addListener(() {
      if (!_videoPlayerController.value.isPlaying &&
          _videoPlayerController.value.position ==
              _videoPlayerController.value.duration) {
        _videoPlayerController.seekTo(Duration.zero);
      }
      setState(() {});
    });

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isCompleted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null) {
      return Container(
        child: const CircularProgressIndicator(
          color: ColorApp.Btn,
        ),
      );
    }
    return Card(
      color: ColorApp.ScafflodColor,
      child: Column(
        children: [
          Container(
            height: 200,
            child: _chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(
                    controller: _chewieController!,
                  )
                : const CircularProgressIndicator(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _chewieController!.isPlaying
                        ? _chewieController!.pause()
                        : _chewieController!.play();
                  });
                },
                icon: Icon(
                  _chewieController!.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _chewieController!.seekTo(_chewieController!
                            .videoPlayerController.value.position -
                        Duration(seconds: 5));
                  });
                },
                icon: Icon(Icons.replay_5),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _chewieController!.seekTo(_chewieController!
                            .videoPlayerController.value.position +
                        Duration(seconds: 5));
                  });
                },
                icon: Icon(
                  Icons.forward_5,
                  color: ColorApp.Btn,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BEE نحلة',
                style: TextStyle(color: ColorApp.hint, fontSize: 20),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
            ],
          )
        ],
      ),
    );
  }
}
