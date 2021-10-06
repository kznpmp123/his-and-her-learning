import 'package:flutter/material.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/ui/routes/about_route.dart';
import 'package:kzn/ui/routes/privacy-policy.dart';
import 'package:kzn/ui/routes/tnc_route.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(child: Text(appName,style: TextStyle(color: Colors.white,fontSize: 36),)),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ListTile(
              tileColor: tileColor,
              leading: Icon(Icons.privacy_tip, color: iconColor,),
              title: Text('Privacy Policy'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, PrivacyPolicyRoute.routeName);

              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ListTile(
              tileColor: tileColor,
              leading: Icon(Icons.privacy_tip, color: iconColor),
              title: Text('Terms of Conditions'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, TnCRoute.routeName);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ListTile(
              tileColor: tileColor,
              leading: Icon(Icons.privacy_tip, color: iconColor),
              title: Text('About'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, AboutRoute.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
