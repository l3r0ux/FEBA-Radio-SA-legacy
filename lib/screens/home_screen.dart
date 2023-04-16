import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../screens/stations.dart';
import '../widgets/main_screen_buttons.dart';

class MyAppHomePage extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Size> _circleGrow;
  Animation<double> _opacityAnimation;

  @override
  void initState() {
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(
      // Triggered if notification gotten with app open
      onMessage: (msg) {
        // var message = msg.values.toList();
        // print(message[0].values.toList());
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertDialog(
        //     title: Text("Pray with us"),
        //     content: Text(message[0].values.toList()[1].toString()),
        //     actions: <Widget>[
        //       FlatButton(
        //         child: Text('Close'),
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //         },
        //       )
        //     ],
        //   ),
        // );
        return;
      },
      // Triggered if notification gotten when app not running
      onLaunch: (msg) {
        print(msg);

        return;
      },
      // Triggered if notification gotten when app in background
      onResume: (msg) {
        print(msg);
        return;
      },
    );

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );
    _circleGrow = Tween<Size>(
      begin: Size(0, 0),
      end: Size(400, 400),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );
    _opacityAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );
    super.initState();
  }

  double _getX(deviceWidth) {
    final screenWidth = (deviceWidth).floor();
    final width = (Random().nextInt(screenWidth)).toDouble();
    var xCoordinate = width / screenWidth * 200;
    final chancePick = Random().nextInt(2);
    if (chancePick == 1) {
      return xCoordinate;
    } else {
      return xCoordinate = xCoordinate * -1;
    }
  }

  double _getY(deviceHeight) {
    final screenHeight = (deviceHeight).floor();
    final height = (Random().nextInt(screenHeight)).toDouble();
    var yCoordinate = height / screenHeight * 200;
    final chancePick = Random().nextInt(2);
    if (chancePick == 1) {
      return yCoordinate;
    } else {
      return yCoordinate = yCoordinate * -1;
    }
  }

  Timer timer;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    timer = Timer.periodic(Duration(milliseconds: 2500), (timer) {
      if (timer != null) {
        timer.cancel();
      }
      setState(() {});
    });

    // To reset the animation to the start on each rebuild and start it again
    _controller.reset();
    _controller.forward();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              width: deviceWidth,
              height: deviceHeight * 0.3,
              decoration: const BoxDecoration(
                image: const DecorationImage(
                  image: const AssetImage('assets/images/FEBALOGO.PNG'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: deviceWidth,
              height: deviceHeight * 0.7,
              decoration: const BoxDecoration(
                image: const DecorationImage(
                  image: const AssetImage('assets/images/world_background.PNG'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            top: deviceHeight >= 850 ? deviceHeight * 0.3 : deviceHeight * 0.24,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: deviceWidth * 0.5,
                height: deviceHeight * 0.06,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 2.5,
                      color: Colors.indigo[300],
                    ),
                    bottom: BorderSide(
                      width: 2.5,
                      color: Colors.indigo[300],
                    ),
                  ),
                ),
                child: FittedBox(
                  child: Text(
                    'MAIN MENU',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceHeight * 0.04,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Growing circles
          Center(
            child: Container(
              transform: Matrix4.translationValues(
                  _getX(deviceWidth), _getY(deviceHeight), 0.0),
              child: AnimatedBuilder(
                animation: _circleGrow,
                builder: (ctx, _) => FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    width: _circleGrow.value.width,
                    height: _circleGrow.value.height,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[300],
                        width: 3,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Column(
            mainAxisAlignment: deviceHeight <= 480
                ? MainAxisAlignment.end
                : MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: deviceHeight * 0.2),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  foregroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: null,
                // onPressed: () {
                // timer.cancel();
                // _controller.dispose();
                // Navigator.of(context)
                //     .pushReplacementNamed(Stations.routeName);
                // },
                child: Container(
                  width: deviceWidth * 0.5,
                  child: Text(
                    'LIVE RADIO (Under Maintainance)',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: deviceHeight * 0.02, color: Colors.black),
                  ),
                ),
              ),
              const MainButtons(
                  'STORIES', 'https://febaradio.co.za/stories-2/'),
              const MainButtons(
                  'PRAYER FOCUS', 'https://febaradio.co.za/prayer/'),
              const MainButtons(
                  'ABOUT US', 'https://febaradio.co.za/about-us/'),
              const MainButtons(
                  'CONTACT US', 'https://febaradio.co.za/contact-us/'),
              const MainButtons(
                  'SUPPORT OUR WORK/DONATE', 'https://febaradio.co.za/donate/'),
            ],
          ),
        ],
      ),
    );
  }
}
