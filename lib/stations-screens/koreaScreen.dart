import 'package:flutter/material.dart';

import '../screens/stations.dart';
import '../widgets/radio.dart';
import '../widgets/radio_background_image.dart';

class KoreaScreen extends StatelessWidget {
  static const routeName = '/korea-screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, Stations.routeName),
          ),
          title: Text("Korea Station"),
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            BackgroundImage(),
            Column(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Text(
                    'Tap on the play button to play or pause the audio stream. Please note that some stations might take a while before the audio starts.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.028),
                  ),
                ),
                Center(
                  child: RadioWidget(Stations.koreaStation, "Korea"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
