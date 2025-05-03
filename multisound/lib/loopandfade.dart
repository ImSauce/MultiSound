import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: Xylophone())));

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  Future<void> playSoundWithFadeIn(int soundNumber) async {
    await player.setVolume(0.0);
    await player.setReleaseMode(ReleaseMode.loop);
    await player.play(AssetSource('$soundNumber.mp3'));
    setState(() => isPlaying = true);

    for (double vol = 0.0; vol <= 1.0; vol += 0.1) {
      await Future.delayed(const Duration(milliseconds: 500));
      await player.setVolume(vol);
    }
  }

  Future<void> stopWithFadeOut() async {
    for (double vol = 1.0; vol >= 0.0; vol -= 0.1) {
      await Future.delayed(const Duration(milliseconds: 100));
      await player.setVolume(vol);
    }
    await player.stop();
    setState(() => isPlaying = false);
  }

  Expanded buildKey({required int soundNumber, required Color color}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          if (!isPlaying) {
            playSoundWithFadeIn(soundNumber);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        child: const Text('Play', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Expanded buildStopButton({required Color color}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          if (isPlaying) {
            stopWithFadeOut();
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        child: const Text('Stop', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(soundNumber: 1, color: const Color.fromARGB(255, 36, 204, 87)),
        buildStopButton(color: Colors.redAccent),
      ],
    ));
  }
}
