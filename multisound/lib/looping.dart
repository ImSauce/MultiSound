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
        buildKey(soundNumber: 4, color: const Color.fromARGB(255, 36, 204, 87)),
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
  final player = AudioPlayer(); // create a new player instance
  await player.setReleaseMode(ReleaseMode.loop); // set to loop
  await player.play(AssetSource('$soundNumber.mp3'));
}
