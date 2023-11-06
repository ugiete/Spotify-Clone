import 'package:flutter/material.dart';
import 'package:spotify_clone/app/utils.dart';
import 'package:spotify_clone/models/audio.dart';
import 'package:spotify_clone/pages/audio/audio_controller.dart';
import 'package:spotify_clone/pages/audio/audio_lyrics.dart';
import 'package:spotify_clone/pages/audio/audio_title.dart';

class AudioPage extends StatefulWidget {
  final String origin;
  final AudioModel audio;

  const AudioPage({super.key, required this.origin, required this.audio});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late ImageProvider image;
  late Color backgroundColor;

  bool loadingImage = true;

  Future<void> loadImage() async {
    image = AssetImage(widget.audio.image);
    backgroundColor = await getImagePalette(image);

    setState(() {
      loadingImage = false;
    });
  }

  @override
  void initState() {
    loadImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: loadingImage ? const Color(0xFF121212) : null,
          gradient: loadingImage
            ? null
            : LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                backgroundColor,
                const Color(0xFF121212)
              ]
            )
        ),
        child: ListView(
          physics: const ScrollPhysics(),
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: const IconButton(
                onPressed: null,
                icon: Icon(Icons.keyboard_arrow_down),
              ),
              title: Text(widget.origin),
              centerTitle: true,
              actions: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.more_horiz),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: loadingImage
                  ? const Center(child: CircularProgressIndicator(color: Colors.greenAccent,))
                  : Image(image: image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                children: [
                  Flexible(
                    child: SongTitle(
                      title: widget.audio.title,
                      author: widget.audio.author
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.favorite_border)
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: AudioController(total: widget.audio.total),
            ),
            if (!loadingImage)
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: AudioLyrics(backgroundColor: backgroundColor)
                ),
              )
          ],
        ),
      ),
    );
  }
}