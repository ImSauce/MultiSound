import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: Xylophone())));

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(soundNumber: 5, color: Colors.red),
      ],
    ));
  }
}




Expanded buildKey({required int soundNumber, required Color color}) {
    return Expanded(
      child: TextButton(
        child: const Text(''),
        onPressed: () {
          playSound(soundNumber);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
      ),
    );
  }



void playSound(int soundNumber) async {
  final player = AudioPlayer();
  await player.setVolume(0.0); // Start silent

  await player.play(AssetSource('$soundNumber.mp3'));

  // Fading in
  for (double vol = 0.0; vol <= 1.0; vol += 0.1) {
    await Future.delayed(const Duration(milliseconds: 500));
    player.setVolume(vol);
  }

  // Wait for sound duration minus fade-out time
  final duration = await player.getDuration();
  final fadeOutStart = duration != null
      ? duration - const Duration(milliseconds: 1000)
      : const Duration(seconds: 2); // fallback
  await Future.delayed(fadeOutStart);

  // Fading out
  for (double vol = 1.0; vol >= 0.0; vol -= 0.1) {
    await Future.delayed(const Duration(milliseconds: 500));
    player.setVolume(vol);
  }

  await player.stop(); // Optional: stop playback after fade out
}