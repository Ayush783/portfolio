import 'package:flutter/material.dart';
import 'package:portfolio/home/home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    precacheAllImages(context);
  }

  precacheAllImages(BuildContext context) {
    precacheImage(const AssetImage('assets/images/12.png'), context);
    precacheImage(const AssetImage('assets/images/1.png'), context);
    precacheImage(const AssetImage('assets/images/2.png'), context);
    precacheImage(const AssetImage('assets/images/3.png'), context);
    precacheImage(const AssetImage('assets/images/4.png'), context);
    precacheImage(const AssetImage('assets/images/5.png'), context);
    precacheImage(const AssetImage('assets/images/6.png'), context);
    precacheImage(const AssetImage('assets/images/country.png'), context);
    precacheImage(const AssetImage('assets/images/db_cover.png'), context);
    precacheImage(const AssetImage('assets/images/dsc.png'), context);
    precacheImage(
        const AssetImage('assets/images/flutter_translator.png'), context);
    precacheImage(const AssetImage('assets/images/yodha.png'), context);
    precacheImage(const AssetImage('assets/images/7.png'), context);
    precacheImage(const AssetImage('assets/images/8.png'), context);
    precacheImage(const AssetImage('assets/images/9.png'), context);
    precacheImage(const AssetImage('assets/images/10.png'), context);
    precacheImage(const AssetImage('assets/images/11.png'), context);

    precacheImage(const AssetImage('assets/images/14.png'), context);
    precacheImage(const AssetImage('assets/images/15.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
