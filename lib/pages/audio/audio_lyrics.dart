import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AudioLyrics extends StatelessWidget {
  final Color backgroundColor;

  const AudioLyrics({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.lyrics,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18
                ),
              ),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.ios_share, color: Colors.white),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Icon(Icons.fullscreen, color: Colors.white),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}