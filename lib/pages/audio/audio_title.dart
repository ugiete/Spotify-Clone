import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class SongTitle extends StatelessWidget {
  final String title;
  final String author;

  const SongTitle({super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextScroll(
          title,
          mode: TextScrollMode.bouncing,
          velocity: const Velocity(pixelsPerSecond: Offset(40, 0)),
          pauseBetween: const Duration(seconds: 2),
          pauseOnBounce: const Duration(seconds: 2),
          delayBefore: const Duration(seconds: 5),
          style: const TextStyle(
            overflow: TextOverflow.clip,
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          author,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}