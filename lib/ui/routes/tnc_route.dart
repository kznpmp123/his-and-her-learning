import 'package:flutter/material.dart';

class TnCRoute extends StatefulWidget {
  static final String routeName = "/tnc_route";
  @override
  _TnCRouteState createState() => _TnCRouteState();
}

class _TnCRouteState extends State<TnCRoute> {
  final Color tileColor = Colors.redAccent;
  final Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terms and Conditions")),
      body: SingleChildScrollView(child: Text(
          '''
        You can see your previous Terms here.

Thanks for using Dropbox! Our mission is to create a more enlightened way of working by providing an intuitive, unified platform to keep your content safe and accessible while helping you and those you work with stay coordinated and in sync. These terms of service (“Terms”) cover your use and access to our services, client software and websites ("Services"). If you reside outside of the United States of America, Canada and Mexico (“North America”) your agreement is with Dropbox International Unlimited Company. If you reside in North America your agreement is with Dropbox, Inc. Our Privacy Policy explains how we collect and use your information while our Acceptable Use Policy outlines your responsibilities when using our Services. By using our Services, you’re agreeing to be bound by these Terms, our Privacy Policy, and Acceptable Use Policy.

Your Stuff & Your Permissions
When you use our Services, you provide us with things like your files, content, messages, contacts, and so on (“Your Stuff”). Your Stuff is yours. These Terms don’t give us any rights to Your Stuff except for the limited rights that enable us to offer the Services.

We need your permission to do things like hosting Your Stuff, backing it up, and sharing it when you ask us to. Our Services also provide you with features like commenting, sharing, searching, image thumbnails, document previews, optical character recognition (OCR), easy sorting and organization, and personalization to help reduce busywork. To provide these and other features, Dropbox accesses, stores, and scans Your Stuff. You give us permission to do those things, and this permission extends to our affiliates and trusted third parties we work with.

Your Responsibilities
Your use of our Services must comply with our Acceptable Use Policy. Content in the Services may be protected by others’ intellectual property rights. Please don’t copy, upload, download, or share content unless you have the right to do so.

Dropbox may review your conduct and content for compliance with these Terms and our Acceptable Use Policy. We aren’t responsible for the content people post and share via the Services.

Help us keep Your Stuff protected. Safeguard your password to the Services, and keep your account information current. Don’t share your account credentials or give others access to your account.

You may use our Services only as permitted by applicable law, including export control laws and regulations. Finally, to use our Services, you must be at least 13 (or older, depending on where you live).
        '''
      )),

    );
  }
}


