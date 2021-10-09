import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/home_screen.dart';
import './screens/stations.dart';
import './stations-screens/chinaScreen.dart';
import './stations-screens/cambodiaScreen.dart';
import './stations-screens/koreaScreen.dart';
import './stations-screens/mongoliaScreen.dart';
import './stations-screens/philippinesScreen.dart';
import './stations-screens/russiaScreen.dart';
import './stations-screens/indiaScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feba Radio SA',
      home: MyAppHomePage(),
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      routes: {
        MyAppHomePage.routeName: (ctx) => MyAppHomePage(),
        Stations.routeName: (ctx) => Stations(),
        IndiaScreen.routeName: (ctx) => IndiaScreen(),
        ChinaScreen.routeName: (ctx) => ChinaScreen(),
        CambodiaScreen.routeName: (ctx) => CambodiaScreen(),
        KoreaScreen.routeName: (ctx) => KoreaScreen(),
        MongoliaScreen.routeName: (ctx) => MongoliaScreen(),
        PhilippinesScreen.routeName: (ctx) => PhilippinesScreen(),
        RussiaScreen.routeName: (ctx) => RussiaScreen(),
      },
    );
  }
}

// CHECK THIS TO LEARN HOW TO MAKE CIRCLES
// https://blog.codemagic.io/flutter-custom-painter/

// to create appbudle, run 'flutter build appbundle'