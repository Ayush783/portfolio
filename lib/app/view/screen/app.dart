import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/view/controller/app_theme_controller.dart';
import 'package:portfolio/home/home.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/utils/firebase_analytics_service.dart';

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      precacheAllImages(context);
    });

    FirebaseAnalyticsService.logEvents('Opened App');

    super.initState();
  }

  precacheAllImages(BuildContext context) {
    precacheImage(const AssetImage('assets/images/12.webp'), context);
    precacheImage(const AssetImage('assets/images/1.webp'), context);
    precacheImage(const AssetImage('assets/images/2.webp'), context);
    precacheImage(const AssetImage('assets/images/3.webp'), context);
    precacheImage(const AssetImage('assets/images/4.webp'), context);
    precacheImage(const AssetImage('assets/images/5.webp'), context);
    precacheImage(const AssetImage('assets/images/6.webp'), context);
    precacheImage(const AssetImage('assets/images/country.webp'), context);
    precacheImage(const AssetImage('assets/images/db_cover.webp'), context);
    precacheImage(const AssetImage('assets/images/dsc.webp'), context);
    precacheImage(
        const AssetImage('assets/images/flutter_translator.webp'), context);
    precacheImage(const AssetImage('assets/images/yodha.webp'), context);
    precacheImage(const AssetImage('assets/images/7.webp'), context);
    precacheImage(const AssetImage('assets/images/8.webp'), context);
    precacheImage(const AssetImage('assets/images/9.webp'), context);
    precacheImage(const AssetImage('assets/images/10.webp'), context);
    precacheImage(const AssetImage('assets/images/11.webp'), context);

    precacheImage(const AssetImage('assets/images/14.webp'), context);
    precacheImage(const AssetImage('assets/images/15.webp'), context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeController).currentTheme;
    return Semantics(
      label:
          'Portfolio website made with Flutter Web by AAYUSH SHARMA | FLUTTER DEVELOPER.',
      child: MaterialApp(
        title: 'Aayush Sharma',
        theme: theme.themeData,
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
