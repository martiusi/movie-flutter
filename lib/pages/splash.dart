import 'dart:async';
import 'package:flutter/material.dart';
import 'movie_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 3000), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MoviePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.local_play),
              onPressed: null,
              iconSize: 80.0,
            ),
            Text(
              'Your app for Movies',
              style: TextStyle(
                fontSize: 44.0,
                color: Colors.cyan,
                fontWeight: FontWeight.w800,
                fontFamily: "Cursive",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
