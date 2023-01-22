import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isPlayer = false, isMute = false;
  late String title = '', author = 'autho';

  final String url = 'https://www.youtube.com/watch?v=o9CqXYH-Qws';
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController _controller;
  late String id;

  @override
  void initState() {
    super.initState();
    id = YoutubePlayer.convertUrlToId(url)!;
    print('-----------------------');
    print(id);
    _controller = YoutubePlayerController(initialVideoId: id);
    youtubePlayer = YoutubePlayer(controller: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('youtube playter'),
        backgroundColor: Color.fromARGB(255, 79, 77, 77),
      ),
      backgroundColor: Color.fromARGB(255, 149, 148, 148),
      body: Column(
        children: [
          Container(
            height: 400,
            width: 430,
            color: Color.fromARGB(255, 38, 38, 38),
            child: youtubePlayer,
          ),
          textBuilder(title),
          textBuilder(author, fontSize: 25, color: Colors.pink),
          buttonRowBuilder()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: isMute ? Icon(Icons.volume_off) : Icon(Icons.volume_up),
      ),
    );
  }

  textBuilder(String string,
      {double fontSize = 17,
      FontWeight weight = FontWeight.normal,
      Color color = Colors.black}) {
    return Container(
      margin: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Text(
        string,
        style: TextStyle(fontSize: fontSize, fontWeight: weight, color: color),
      ),
    );
  }

  buttonRowBuilder() {
    double size = 35;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.first_page),
          iconSize: size,
        ),
        IconButton(
          onPressed: () {},
          icon: isPlayer ? Icon(Icons.pause) : Icon(Icons.play_arrow),
          iconSize: size,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.last_page),
          iconSize: size,
        ),
      ],
    );
  }
}
