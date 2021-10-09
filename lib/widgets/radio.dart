import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_radio/flutter_radio.dart';

class RadioWidget extends StatefulWidget {
  final String url;
  final String station;
  // final bool isPlaying;

  RadioWidget(this.url, this.station);

  @override
  _RadioWidgetState createState() => new _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    audioStart();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
  }

  Future<void> playingStatus() async {
    bool isP = await FlutterRadio.isPlaying();
    isPlaying = isP;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: isPlaying
          ? Image.asset(
              'assets/images/play.PNG',
              width: MediaQuery.of(context).size.width * 0.7,
            )
          : Image.asset(
              'assets/images/pause.PNG',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
      onPressed: () async {
        await playingStatus();
        if (!isPlaying) {
          FlutterRadio.play(url: widget.url);
        } else {
          FlutterRadio.stop();
        }
      },
    );
  }
}
