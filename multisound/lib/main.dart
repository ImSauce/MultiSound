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
        buildKey(soundNumber: 1, color: Colors.red),
        buildKey(soundNumber: 2, color: Colors.orange),
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
    final player = AudioPlayer(); // create a new instance
    await player.play(AssetSource('$soundNumber.mp3'));
  }



// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';


// void main() => runApp(MaterialApp(home: Scaffold(body: Xylophone())));


// class Xylophone extends StatelessWidget {
//  const Xylophone({Key? key}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//        child: Column(
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: [
//        buildKey(soundNumber: 1, color: Colors.red),
//        buildKey(soundNumber: 2, color: Colors.orange),

//      ],
//    ));
//  }
// }


// final player = AudioPlayer();
// void playSound(int soundNumber) async {
//   await player.play(AssetSource('$soundNumber.mp3'));
// }



// final player2 = AudioPlayer();
// void playSound2(int soundNumber) async {
//   await player.play(AssetSource('$soundNumber.mp3'));
// }

// Expanded buildKey({required int soundNumber, required Color color}) {
//  return Expanded(
//    child: TextButton(
//      child: Text(''),
//      onPressed: () {
//        playSound(soundNumber);
//      },
//      style:
//          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
//    ),
//  );
// }


// Expanded buildKey2({required int soundNumber, required Color color}) {
//  return Expanded(
//    child: TextButton(
//      child: Text(''),
//      onPressed: () {
//        playSound2(soundNumber);
//      },
//      style:
//          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
//    ),
//  );
// }
