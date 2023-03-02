import 'package:aiassistant/screens/ChatMessageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Privacy Policy',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    launch(
                        'https://aiassistantgpt.wordpress.com/2023/02/08/ai-assitant-gpt-privacy-policy/');
                  },
                  child: Text(
                    '''https://aiassistantgpt.wordpress.com/2023/02/08/ai-assitant-gpt-privacy-policy/''',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              Text(
                '''


Effective date: February 2, 2023

My AI Assistant ("us", "we", or "our") operates the My AI Assistant mobile application (hereinafter referred to as the "Service").

This page informs you of our policies regarding the collection, use and disclosure of personal data when you use our Service and the choices you have associated with that data.

We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.

Definitions

Service
Service is the My AI Assistant mobile application operated by My AI Assistant

Personal Data
Personal Data means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession).

Usage Data
Usage Data is data collected automatically either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).

Cookies
Cookies are small files stored on your device (computer or mobile device).

 
Data Controller
Data Controller means the natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal information are, or are to be, processed.

For the purpose of this Privacy Policy, we are a Data Controller of your Personal Data.

Data Processors (or Service Providers)
Data Processor (or Service Provider) means any natural or legal person who processes the data on behalf of the Data Controller.
We may use the services of various Service Providers in order to process your data more effectively.

Data Subject (or User)
Data Subject is any living individual who is using our Service and is the subject of Personal Data.

Information Collection and Use
We collect several different types of information for various purposes to provide and improve our Service to you.

Types of Data Collected

Personal Data
While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally identifiable information may include, but is not limited to:

Email address
First name and last name
Phone number
Address, State, Province, ZIP/Postal code, City
Cookies and Usage Data
We may use your Personal Data to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you. You may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or the instructions provided in any email we send.

Usage Data
When you access the Service with a mobile device, we may collect certain information automatically, including, but not limited to, the type of mobile device you use, your mobile device unique ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browser you use, unique device identifiers and other diagnostic data ("Usage Data").

Tracking & Cookies Data
We use cookies and similar tracking technologies to track the activity on our Service and we hold certain information.

Cookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyse our Service.

You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.

Examples of Cookies we use:

Session Cookies. We use Session Cookies to operate our Service.
Preference Cookies. We use Preference Cookies to remember your preferences and various settings.
Security Cookies. We use Security Cookies for security purposes.
Advertising Cookies. Advertising Cookies are used to serve you with advertisements that may be relevant to you and your interests.
Use of Data

My AI Assistant uses the collected data for various purposes:

To provide and maintain our Service
To notify you about changes to our Service
To allow you to participate in interactive features of our Service when you choose to do so
To provide customer support
To gather analysis or valuable information so that we can improve our Service
To monitor the usage of our Service
To detect, prevent and address technical issues
To provide you with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless you have opted not to receive such information
Legal Basis for Processing Personal Data under the General Data Protection Regulation (GDPR)

If you are from the European Economic Area (EEA), My AI Assistant legal basis for collecting and using the personal information described in this Privacy Policy depends on the Personal Data we collect and the specific context in which we collect it.

My AI Assistant may process your Personal Data because:
We need to perform a contract with you
You have given us permission to do so
The processing is in our legitimate interests and it is not overridden by your rights
For payment processing purposes
To comply with the law
Retention of Data

My AI Assistant will retain your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes and enforce our legal agreements and policies.

My AI Assistant will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer periods.

Transfer of Data
Your information, including Personal Data, may be transferred to — and maintained on — computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.

If you are located outside Turkey and choose to provide information to us, please note that we transfer the data, including Personal Data, to Turkey and process it there.

Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.

My AI Assistant will take all the steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organisation or a country unless there are adequate controls in place including the security of your data and other personal information.

Disclosure of Data

Business Transaction
If My AI Assistant is involved in a merger, acquisition or asset sale, your Personal Data may be transferred. We will provide notice before your Personal Data is transferred and becomes subject to a different Privacy Policy.

Disclosure for Law Enforcement
Under certain circumstances, My AI Assistant may be required to disclose your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).

Legal Requirements
My AI Assistant may disclose your Personal Data in the good faith belief that such action is necessary to:

To comply with a legal obligation
To protect and defend the rights or property of My AI Assistant
To prevent or investigate possible wrongdoing in connection with the Service
To protect the personal safety of users of the Service or the public
To protect against legal liability
Security of Data

The security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.

We do not support Do Not Track ("DNT"). Do Not Track is a preference you can set in your web browser to inform websites that you do not want to be tracked.

You can enable or disable Do Not Track by visiting the Preferences or Settings page of your web browser.

Your Data Protection Rights under the General Data Protection Regulation (GDPR)

If you are a resident of the European Economic Area (EEA), you have certain data protection rights. My AI Assistant aims to take reasonable steps to allow you to correct, amend, delete or limit the use of your Personal Data.

If you wish to be informed about what Personal Data we hold about you and if you want it to be removed from our systems, please contact us.

In certain circumstances, you have the following data protection rights:

The right to access, update or delete the information we have on you. Whenever made possible, you can access, update or request deletion of your Personal Data directly within your account settings section. If you are unable to perform these actions yourself, please contact us to assist you.

The right of rectification. You have the right to have your information rectified if that information is inaccurate or incomplete.

The right to object. You have the right to object to our processing of your Personal Data.

The right of restriction. You have the right to request that we restrict the processing of your personal information.

The right to data portability. You have the right to be provided with a copy of the information we have on you in a structured, machine-readable and commonly used format.

The right to withdraw consent. You also have the right to withdraw your consent at any time where My AI Assistant relied on your consent to process your personal information.

Please note that we may ask you to verify your identity before responding to such requests.

You have the right to complain to a Data Protection Authority about our collection and use of your Personal Data. For more information, please contact your local data protection authority in the European Economic Area (EEA).

Service Providers
We may employ third party companies and individuals to facilitate our Service ("Service Providers"), provide the Service on our behalf, perform Service-related services or assist us in analysing how our Service is used.

These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.

Analytics
We may use third-party Service Providers to monitor and analyse the use of our Service.

Google Analytics
Google Analytics is a web analytics service offered by Google that tracks and reports website traffic. Google uses the data collected to track and monitor the use of our Service. This data is shared with other Google services. Google may use the collected data to contextualise and personalise the ads of its own advertising network.

You may opt-out of certain Google Analytics features through your mobile device settings, such as your device advertising settings or by following the instructions provided by Google in their Privacy Policy: https://policies.google.com/privacy?hl=en

For more information on the privacy practices of Google, please visit the Google Privacy & Terms web page:''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://policies.google.com/privacy?hl=en');
                },
                child: Text(
                  '''https://policies.google.com/privacy?hl=en''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''

Firebase
Firebase is an analytics service provided by Google Inc.

You may opt-out of certain Firebase features through your mobile device settings, such as your device advertising settings or by following the instructions provided by Google in their Privacy Policy: https://policies.google.com/privacy?hl=en

We also encourage you to review the Google's policy for safeguarding your data: ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://support.google.com/analytics/answer/6004245');
                },
                child: Text(
                  '''https://support.google.com/analytics/answer/6004245''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''For more information on what type of information Firebase collects, please visit the Google Privacy & Terms web page:''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://policies.google.com/privacy?hl=en');
                },
                child: Text(
                  '''https://policies.google.com/privacy?hl=en''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''Advertising

We may use third-party Service Providers to show advertisements to you to help support and maintain our Service.

Google AdSense & DoubleClick Cookie
Google, as a third party vendor, uses cookies to serve ads on our Service. Google's use of the DoubleClick cookie enables it and its partners to serve ads to our users based on their visit to our Service or other websites on the Internet.

You may opt out of the use of the DoubleClick Cookie for interest-based advertising by visiting the Google Ads Settings web page: http://www.google.com/ads/preferences/

AdMob by Google
AdMob by Google is provided by Google Inc.

You can opt-out from the AdMob by Google service by following the instructions described by Google: ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://support.google.com/ads/answer/2662922?hl=en');
                },
                child: Text(
                  '''https://support.google.com/ads/answer/2662922?hl=en''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''

For more information on how Google uses the collected information, please visit the "How Google uses data when you use our partners' sites or app" page: http://www.google.com/policies/privacy/partners/ or visit the Privacy Policy of Google: http://www.google.com/policies/privacy/

Behavioral Remarketing
My AI Assistant uses remarketing services to advertise on third party websites to you after you visited our Service. We and our third-party vendors use cookies to inform, optimise and serve ads based on your past visits to our Service.

 
Google Ads (AdWords)
Google Ads (AdWords) remarketing service is provided by Google Inc.

You can opt-out of Google Analytics for Display Advertising and customise the Google Display Network ads by visiting the Google Ads Settings page: http://www.google.com/settings/ads

Google also recommends installing the Google Analytics Opt-out Browser Add-on - ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://tools.google.com/dlpage/gaoptout');
                },
                child: Text(
                  '''https://tools.google.com/dlpage/gaoptout''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                ''' - for your web browser. Google Analytics Opt-out Browser Add-on provides visitors with the ability to prevent their data from being collected and used by Google Analytics.

For more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://policies.google.com/privacy?hl=en');
                },
                child: Text(
                  '''https://policies.google.com/privacy?hl=en''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''

Twitter
Twitter remarketing service is provided by Twitter Inc.

You can opt-out from Twitter's interest-based ads by following their instructions: ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://support.twitter.com/articles/20170405');
                },
                child: Text(
                  '''https://support.twitter.com/articles/20170405''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''You can learn more about the privacy practices and policies of Twitter by visiting their Privacy Policy page: ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://twitter.com/privacy');
                },
                child: Text(
                  '''https://twitter.com/privacy''',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''

Facebook
Facebook remarketing service is provided by Facebook Inc.

You can learn more about interest-based advertising from Facebook by visiting this page: ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://www.facebook.com/help/164968693837950');
                },
                child: Text(
                  '''https://www.facebook.com/help/164968693837950''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''

To opt-out from Facebook's interest-based ads, follow these instructions from Facebook: ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://www.facebook.com/help/568137493302217');
                },
                child: Text(
                  '''https://www.facebook.com/help/568137493302217''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''

Facebook adheres to the Self-Regulatory Principles for Online Behavioural Advertising established by the Digital Advertising Alliance. You can also opt-out from Facebook and other participating companies through the Digital Advertising Alliance in the USA http://www.aboutads.info/choices/, the Digital Advertising Alliance of Canada in Canada http://youradchoices.ca/ or the European Interactive Digital Advertising Alliance in Europe http://www.youronlinechoices.eu/, or opt-out using your mobile device settings.

For more information on the privacy practices of Facebook, please visit Facebook's Data Policy: ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://www.facebook.com/privacy/explanation');
                },
                child: Text(
                  '''https://www.facebook.com/privacy/explanation''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''

Payments
We may provide paid products and/or services within the Service. In that case, we use third-party services for payment processing (e.g. payment processors).

We will not store or collect your payment card details. That information is provided directly to our third-party payment processors whose use of your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, MasterCard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.

The payment processors we work with are:

Apple Store In-App Payments
Their Privacy Policy can be viewed at ''',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  launch('https://www.apple.com/legal/privacy/en-ww/');
                },
                child: Text(
                  '''https://www.apple.com/legal/privacy/en-ww/''',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Text(
                '''

Links to Other Sites
Our Service may contain links to other sites that are not operated by us. If you click a third party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy of every site you visit.

We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.

Children's Privacy
Our Service does not address anyone under the age of 18 ("Children").

We do not knowingly collect personally identifiable information from anyone under the age of 18. If you are a parent or guardian and you are aware that your Child has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from children without verification of parental consent, we take steps to remove that information from our servers.

Changes to This Privacy Policy
We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.

We will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update the "effective date" at the top of this Privacy Policy.

You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.

Contact Us
If you have any questions about this Privacy Policy, please contact us.
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
