import 'package:flutter/material.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/utils/open_facebook.dart';

class AppFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.video_collection_rounded),
      label: Text("Contact To Admin"),
      onPressed: (){
        //Navigator.pushNamed(context, OTPScreen.routeName);
        print("Contact to Admin onPressed");
        OpenFacebook.open(fbProtocolUrl, fallbackUrl);
      },
    );
  }
}
