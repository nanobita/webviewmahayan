/*
 *  main.dart
 *
 *  Created by Ilya Chirkunov <xc@yar.net> on 28.12.2020.
 */

import 'package:flutter/material.dart';
import 'package:radio_player/radio_player.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(radiomahayan());
}

class radiomahayan extends StatefulWidget {
  @override
  _radiomahayanState createState() => _radiomahayanState();
}

class _radiomahayanState extends State<radiomahayan> {
  RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? mahayan;

  @override
  void initState() {
    super.initState();
    initRadioPlayer();
  }

  void initRadioPlayer() {
    _radioPlayer.setMediaItem('Radio Player',
        'http://radio.hostinglotus.com:6004/', 'assets/cover.jpg');
    _radioPlayer.play();
    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        mahayan = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wat-tam-ma.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: [
                    Spacer(),
                    FutureBuilder(
                      future: _radioPlayer.getMetadataArtwork(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        Image artwork;
                        if (snapshot.hasData) {
                          artwork = snapshot.data;
                        } else {
                          artwork = Image.asset(
                            'assets/ma.gif',
                            fit: BoxFit.cover,
                          );
                        }
                        return Container(
                          height: 180,
                          width: 180,
                          child: ClipRRect(
                            child: artwork,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      mahayan?[0] ?? 'PlayRadio',
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(
                      width: 95,
                    )
                  ],
                ),
                Text(
                  mahayan?[1] ?? '',
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            isPlaying ? _radioPlayer.pause() : _radioPlayer.play();
          },
          tooltip: 'Increment',
          backgroundColor: Color(0xff06203e),
          child: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
          ),
        ),
      ),
    );
  }
}
