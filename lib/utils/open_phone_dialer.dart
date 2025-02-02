import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void openDialer(String phoneNumber) async {
  Uri phoneno = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(phoneno)) {
    await launchUrl(phoneno);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}

void openWhatsApp(String phoneNumber) async {
  final String whatsappUrl = "https://wa.me/$phoneNumber";

  if (await canLaunchUrlString(whatsappUrl)) {
    await launchUrlString(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch WhatsApp';
  }
}
