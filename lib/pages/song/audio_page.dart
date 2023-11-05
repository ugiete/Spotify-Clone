import 'package:flutter/material.dart';
import 'package:spotify_clone/app/assets.dart';
import 'package:spotify_clone/app/utils.dart';
import 'package:spotify_clone/pages/song/audio_controller.dart';
import 'package:spotify_clone/pages/song/audio_lyrics.dart';
import 'package:spotify_clone/pages/song/audio_title.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late ImageProvider image;
  late Color backgroundColor;

  bool loadingImage = true;

  Future<void> loadImage() async {
    image = const AssetImage('$kAssetsImages/beatles.png');
    backgroundColor = await getImagePalette(image);

    await Future.delayed(const Duration(seconds: 2));

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
              title: const Text('1(Remastered)'),
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
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                children: [
                  Flexible(
                    child: SongTitle(
                      title: 'From me to You - Mono/Remastered',
                      author: 'The Beatles'
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.favorite_border)
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: AudioController(
                total: Duration(minutes: 4),
              ),
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