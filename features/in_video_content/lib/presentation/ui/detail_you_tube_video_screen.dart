import 'package:common/utils/arguments/detail_you_tube_video_argument.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/youtube_player_flutter/youtube_player_flutter.dart';

class DetailYouTubeVideoScreen extends StatefulWidget {
  final DetailYouTubeVideoArgument argument;

  const DetailYouTubeVideoScreen({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  _DetailYouTubeVideoScreenState createState() =>
      _DetailYouTubeVideoScreenState();
}

class _DetailYouTubeVideoScreenState extends State<DetailYouTubeVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.argument.youTubeId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.argument.youTubeTitle),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
