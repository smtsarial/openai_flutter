import 'package:aiassistant/screens/ChatMessageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms Of Use'),
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Terms Of Use',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    launch(
                        'https://aiassistantgpt.wordpress.com/2023/02/10/ai-assistant-gpt-terms-and-conditions/');
                  },
                  child: Text(
                    '''https://aiassistantgpt.wordpress.com/2023/02/10/ai-assistant-gpt-terms-and-conditions/''',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              Text(
                '''
These terms will automatically apply to you if you download or use the app, so you should be sure you properly read them before using the app. The app, any component of the app, or our trademarks may not be copied or modified in any way. The app's source code cannot be attempted to be extracted, and creating derivative versions or translating the app into other languages is not permitted. The application itself, as well as all associated trademarks, copyrights, database rights, and other IP.

The app's owner is dedicated to making sure it is as effective and useful as possible. Because of this, we reserve the right to alter the app or impose fees for using its features whenever we see fit. You will never be charged for the app or its services unless you are completely aware of what you are purchasing.

In order to deliver our Service, the app stores and processes personal data that you have submitted to us. You are in charge of keeping the app and your phone secure. In order to avoid software restrictions and limits imposed by your device's official operating system, we advise against jailbreaking or rooting your phone. The security features of your phone may be compromised, making it more susceptible to malware, viruses, and dangerous apps. Additionally, the app may not function at all or properly.

The application does make use of third-party services with their own set of terms and conditions.

You should be aware that the owner won't be held accountable for all situations. The app will need to have an active internet connection for some of its features. The connection can be Wi-Fi or provided by your mobile network carrier, but the owner cannot be held liable if the app does not function fully if Wi-Fi is not available and there is no remaining data on your plan.
‍
You should keep in mind that your contract terms with your mobile network carrier will still be in effect if you use the app outside of a Wi-Fi hotspot. As a result, you can incur additional fees from third parties or be charged by your mobile service provider for the cost of data for the time that you were connected and using the app. If you use the app outside of your home area (i.e., region or nation) without turning off data roaming, you agree to pay any associated fees as a condition of doing so, including roaming data fees. Please be aware that we presume you have authorization from the bill payer for the device on which you are using the app if you are not the bill payer.

In a similar manner, the app's owner cannot always be held accountable for how you use it, for example. You must keep your device charged; if it runs out of power and cannot be turned on to use the Service, the owner cannot be held liable.

When using the app, it's important to keep in mind that although we make every effort to ensure that it is current and accurate at all times, we do rely on third parties to provide information to us so that we can make it available to you. This is relevant to the owner responsibility for your use of the app. The owner disclaims all responsibility for any direct or indirect losses you may incur as a result of depending solely on this app's functionality.

We might want to upgrade the app at some point. The app is now available on iOS, but if you want to keep using it, you'll need to download updates since the system's specifications (and those of any other systems we decide to make the app available on) may change. The developer does not guarantee that it will update the app frequently enough to make it useful to you and/or compatible with the iOS version you have installed on your device. We may decide to stop supplying the app, and we may terminate your use of it at any time without providing you with notice of termination. Nevertheless, you agree to always accept updates to the application when given to you. Upon any termination, (a) the licenses and rights granted to you under these terms will terminate, unless we notify you otherwise; and (b) you must stop using the app and (if necessary) remove it from your device.

Term and Condition Modifications

Our Terms and Conditions may occasionally be updated. As a result, you are urged to periodically check this page for updates. By publishing the updated Terms and Conditions on this website, we will let you know about any changes. As on February 2nd, 2023, these terms and conditions are in force.
''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
