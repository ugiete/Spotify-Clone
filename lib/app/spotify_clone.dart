import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spotify_clone/app/assets.dart';
import 'package:spotify_clone/models/audio.dart';
import 'package:spotify_clone/pages/audio/audio_page.dart';

class SpotifyCloneApp extends StatelessWidget {
  const SpotifyCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Spotify Clone',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en')
      ],
      debugShowCheckedModeBanner: false,
      home: AudioPage(
        origin: '1(Remastered)',
        audio: AudioModel(
          title: 'From me to You - Mono/Remastered',
          author: 'The Beatles',
          image: '$kAssetsImages/beatles.png',
          total: Duration(minutes: 3, seconds: 10),
          lyrics: ''
        ),
      ),
    );
  }
}