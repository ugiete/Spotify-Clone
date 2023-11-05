import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class DurationState {
  final Duration progress;
  final Duration buffered;

  DurationState({required this.progress, required this.buffered});

  DurationState.empty()
    : progress = Duration.zero,
      buffered = Duration.zero;
}

class AudioController extends StatefulWidget {
  final Duration total;

  const AudioController({super.key, required this.total});

  @override
  State<AudioController> createState() => _AudioControllerState();
}

class _AudioControllerState extends State<AudioController> {
  Stream<DurationState> startStreaming() {
    return Stream.periodic(
      const Duration(seconds: 1),
      (int value) {
        return DurationState(
          progress: Duration(seconds: value),
          buffered: value + 5 >= widget.total.inSeconds
            ? widget.total
            : Duration(seconds: value + 5)
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<DurationState>(
          stream: null,
          builder: (BuildContext context, AsyncSnapshot<DurationState> snapshot) {
            DurationState state = snapshot.data ?? DurationState.empty();

            return ProgressBar(
              progress: state.progress,
              buffered: state.buffered,
              total: widget.total,
              progressBarColor: Colors.white,
              thumbColor: Colors.white,
              bufferedBarColor: Colors.grey,
              baseBarColor: const Color(0xFF777777),
              timeLabelTextStyle: const TextStyle(
                color: Colors.white
              ),
            );
          }
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.shuffle,
                color: Colors.greenAccent,
                size: 22,
              ),
              Icon(
                Icons.fast_rewind,
                color: Colors.white,
                size: 36,
              ),
              Icon(
                Icons.pause_circle,
                color: Colors.white,
                size: 64,
              ),
              Icon(
                Icons.fast_forward,
                color: Colors.white,
                size: 36,
              ),
              Icon(
                Icons.replay,
                color: Colors.greenAccent,
                size: 22,
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.devices,
                color: Colors.white,
                size: 20
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.ios_share,
                    color: Colors.white,
                    size: 20
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Icon(
                      Icons.queue_music,
                      color: Colors.white,
                      size: 20
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}