import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: Xylophone())));

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  void playSound(int soundNumber) async {
    final player = AudioPlayer(); // create a new instance
    await player.play(AssetSource('$soundNumber.mp3'));
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(soundNumber: 1, color: Colors.red),
        buildKey(soundNumber: 2, color: Colors.orange),
      ],
    ));
  }
}
