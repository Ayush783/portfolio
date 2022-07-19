import 'package:url_launcher/url_launcher.dart';

class UrlLaunchUtil {
  static Future<void> launch(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
    )) {
      throw 'Could not launch $url';
    }
  }
}
