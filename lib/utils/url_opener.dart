import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String str) async {
  final Uri url = Uri.parse(str);
  await launchUrl(url, mode: LaunchMode.externalApplication);
}
