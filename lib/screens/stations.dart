import 'package:feba_radio/widgets/grid_tile.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../stations-screens/cambodiaScreen.dart';
import '../stations-screens/chinaScreen.dart';
import '../stations-screens/russiaScreen.dart';
import '../stations-screens/philippinesScreen.dart';
import '../stations-screens/koreaScreen.dart';
import '../stations-screens/mongoliaScreen.dart';
import '../stations-screens/indiaScreen.dart';

class Stations extends StatelessWidget {
  static const routeName = '/stations';

  static const indiaStation = "https://stream.radio.co/s383f50ab3/listen";
  static const cambodiaStation = "http://s14.myradiostream.com:10064/;";
  static const russiaStation = "http://stream.teos.fm:8004/mp3_hq";
  static const mongoliaStation = "http://c4.radioboss.fm/stream/87";
  static const chinaStation = "http://ly729.out.airtime.pro:8000/ly729_b";
  static const koreaStation =
      "http://mlive2.febc.net:1935/live/seoulfm/playlist.m3u8";
  static const philippinesStation =
      "http://icecast.eradioportal.com:8000/febc_dzas";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popAndPushNamed(context, MyAppHomePage.routeName);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.popAndPushNamed(context, MyAppHomePage.routeName),
          ),
          title: Text(
            "Choose a Station:",
            style: TextStyle(fontFamily: ''),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.white],
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            GridView(
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              children: <Widget>[
                const RadioCountry(IndiaScreen.routeName,
                    'assets/images/india_flag.PNG', 'India Station'),
                const RadioCountry(CambodiaScreen.routeName,
                    'assets/images/cambodia_flag.PNG', 'Cambodia Station'),
                const RadioCountry(ChinaScreen.routeName,
                    'assets/images/china_flag.PNG', 'China Station'),
                const RadioCountry(KoreaScreen.routeName,
                    'assets/images/korea_flag.PNG', 'Korea Station'),
                const RadioCountry(MongoliaScreen.routeName,
                    'assets/images/mongolia_flag.PNG', 'Mongolia Station'),
                const RadioCountry(
                    PhilippinesScreen.routeName,
                    'assets/images/philippines_flag.PNG',
                    'Philippines Station'),
                const RadioCountry(RussiaScreen.routeName,
                    'assets/images/russia_flag.PNG', 'Russia Station'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
