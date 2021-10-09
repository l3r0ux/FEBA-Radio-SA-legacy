import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainButtons extends StatelessWidget {
  final String btnText;
  final String url;

  const MainButtons(
    this.btnText,
    this.url,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white70,
        onPrimary: Colors.indigo[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      onPressed: () {
        launch(url);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          btnText,
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              color: Colors.black),
        ),
      ),
    );
  }
}
