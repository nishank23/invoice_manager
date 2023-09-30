import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:get/get.dart';

class ConfirmationMailController extends GetxController {
  //TODO: Implement ConfirmationMailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  openEmailApps() async {
    /*final Uri _url = Uri.parse('googlegmail://co?tf=0&to=&subject=&body=&cc=&bcc=&');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    } else {
      throw 'Could not open email apps';
    }*/
    await LaunchApp.openApp(

        appStoreLink: 'https://apps.apple.com/us/app/gmail-email-by-google/id422689480',
        openStore: false,
        androidPackageName: 'com.google.android.gm',
        iosUrlScheme: 'gmailemailbygoogle://',

    );


  }

}
