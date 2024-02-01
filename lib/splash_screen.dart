import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp/accueil.dart';
import 'package:tp/main.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MyHome()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

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
