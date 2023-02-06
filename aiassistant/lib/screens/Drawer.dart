import 'package:aiassistant/main.dart';
import 'package:aiassistant/screens/HelpScreen.dart';
import 'package:aiassistant/screens/PrivacyPolicy.dart';
import 'package:aiassistant/screens/SubscriptionScreen.dart';
import 'package:aiassistant/screens/TermsOfUse.dart';
import 'package:aiassistant/screens/widgets/SettingItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff343541),
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 50,
          ),
          //close button
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Text(
            'SETTINGS',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),

          //container rounded gray border clickable item

          SettingItemWidget(
            onTap: () {
              //NAVIGATE TO SUBSCRIPTION SCREEN
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubscriptionScreen()));
            },
            icon: Icon(Icons.subscriptions),
            title: 'Subscription',
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'SUPPORT',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          //tab for help
          SettingItemWidget(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpScreen()));
            },
            icon: Icon(Icons.help),
            title: 'Help',
          ),
          //tab for restore purchases
          // SettingItemWidget(
          //   onTap: () {
          //     print('object');
          //   },
          //   icon: Icon(Icons.restore),
          //   title: 'Restore Purchases',
          // ),

          SizedBox(
            height: 20,
          ),
          Text(
            'ABOUT',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          //tab for rate us
          SettingItemWidget(
            onTap: () async {
              inAppReview.requestReview();
            },
            icon: Icon(Icons.star),
            title: 'Rate Us',
          ),
          //tab for share with friends
          SettingItemWidget(
            onTap: () {
              print('object');
              //1668537791
              Share.share(
                  'Check this application https://apps.apple.com/us/app/ai-assistant-gpt/id1668537791',
                  subject: 'Look what I found!');
            },
            icon: Icon(Icons.share),
            title: 'Share with Friends',
          ),
          //tab for terms of use
          SettingItemWidget(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsOfUse()));
            },
            icon: Icon(Icons.description),
            title: 'Terms of Use',
          ),
          //tab for privacy policy
          SettingItemWidget(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            },
            icon: Icon(Icons.privacy_tip),
            title: 'Privacy Policy',
          ),

          SettingItemWidget(
            onTap: () async {
              auth.signOut();
              final SharedPreferences prefs = await _prefs;
              prefs.clear();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            icon: Icon(Icons.logout),
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}
