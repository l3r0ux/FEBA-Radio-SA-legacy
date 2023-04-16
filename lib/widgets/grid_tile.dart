import 'package:flutter/material.dart';
// import 'package:flutter_radio/flutter_radio.dart';

class RadioCountry extends StatelessWidget {
  final String routeName;
  final String image;
  final String country;

  const RadioCountry(this.routeName, this.image, this.country);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(routeName).then((context) {
              // FlutterRadio.stop();
            });
          },
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            country,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),
          ),
        ),
      ),
    );
  }
}
