import 'package:flutter/material.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.png'),
            Container(
              height: 15.0,
            ),
            Text(
              "Chargement",
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            Container(
              height: 10,
            ),
            CircularProgressIndicator(),
          ],
        ),
      )),
    );
  }
}
